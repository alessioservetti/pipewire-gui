import 'dart:async';
import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';
import 'package:pipewire_gui/core/widgets/console_widgets.dart';
import 'package:pipewire_gui/features/patchbay/domain/models/patchbay_view.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_layout.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/patchbay_links_painter.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/patchbay_node_box.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/patchbay_port.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

/// Zoomable / pannable canvas (mouse wheel or buttons = zoom, drag on empty area = pan).
///
/// Nothing here assumes a box size: every box measures itself ([NodeGeometry]) and the canvas
/// uses those values to place nodes and attach links.
/// - a node not measured yet is laid out offstage (invisible) just to get its geometry;
/// - once every node is measured, the new ones are placed: back where they were in the previous
///   session ([savedPositions]), else by the layout ([placeNewNodes]); placed nodes then move only
///   when the user drags them, polls never shift them;
/// - after a node is placed, dragged or removed, the positions of the nodes on the canvas are
///   reported with [onPositionsChanged] to be saved (nodes gone are dropped from them);
/// - the canvas is a large fixed world with the layout origin in the middle, so nodes can be
///   dragged in every direction;
/// - [toolbar] (top-left) and the zoom controls (top-right) float over it: the first view and
///   "fit" keep the nodes below them.
///
/// Editing, like qpwgraph:
/// - drag from a port to a compatible one (either direction) → [onLink] (output port, input port);
/// - click a link to select it, Delete (Canc) → [onUnlink];
/// - press on a node to select it, Delete (Canc) → [onDeleteNode];
/// - click on empty canvas to deselect.
class PatchbayCanvas extends StatefulWidget {
  const PatchbayCanvas({
    super.key,
    required this.view,
    required this.onLink,
    required this.onUnlink,
    required this.onDeleteNode,
    required this.toolbar,
    required this.savedPositions,
    required this.onPositionsChanged,
  });

  final PatchbayView view;

  /// Positions of the previous session by [PatchbayNode.key]. Each one is used once, when its
  /// node is first placed.
  final IMap<String, Offset> savedPositions;

  /// Positions of the nodes on the canvas by [PatchbayNode.key], [_PatchbayCanvasState._saveDelay]
  /// after the last change. Never called while no node is placed (PipeWire restarting): the saved
  /// positions are kept.
  final void Function(Map<String, Offset> positions) onPositionsChanged;

  /// Floating at the top-left corner.
  final Widget toolbar;
  final void Function(int outputPortId, int inputPortId) onLink;
  final void Function(int linkId) onUnlink;

  /// Delete pressed on the selected node: the caller decides whether and how it can be removed.
  final void Function(PatchbayNode node) onDeleteNode;

  @override
  State<PatchbayCanvas> createState() => _PatchbayCanvasState();
}

class _PatchbayCanvasState extends State<PatchbayCanvas> {
  /// Scale shown as 100%: what the patchbay opens at. Raise it to see everything bigger at 100%.
  static const _baseScale = 1.0;

  /// Zoom limits: 25%..250% of [_baseScale].
  static const _minScale = 0.25 * _baseScale;
  static const _maxScale = 2.5 * _baseScale;
  static const _zoomStep = 1.1;

  /// Distance of the floating toolbars from the canvas edges.
  static const _overlayMargin = 16.0;

  /// Positions are reported after this quiet time: one save for a burst of changes.
  static const _saveDelay = Duration(milliseconds: 500);

  /// How close to a link a click selects it, in screen pixels (whatever the zoom).
  static const _linkHitTolerance = 6.0;

  /// World size; layout coordinates (0,0) sit at [_origin], in the middle.
  static const _world = 20000.0;
  static const _origin = Offset(_world / 2, _world / 2);

  /// Starts at [_baseScale], layout (0,0) at the top-left corner (moved below the toolbars once the
  /// first nodes are placed, see [_showBelowToolbars]).
  final _transform = TransformationController(
    Matrix4.translationValues(
      -_origin.dx * _baseScale,
      -_origin.dy * _baseScale,
      0,
    ).multiplied(Matrix4.diagonal3Values(_baseScale, _baseScale, 1)),
  );

  /// The floating toolbars, measured to keep the nodes below them.
  final _toolbarKey = GlobalKey();
  final _zoomKey = GlobalKey();

  /// The view has not been moved below the toolbars yet (done once, on the first placement).
  bool _firstView = true;

  /// Saved positions not used yet, by node key: taken (and removed) when their node is placed.
  late final Map<String, Offset> _restorable = widget.savedPositions.unlock;

  Timer? _saveTimer;

  /// The world box: converts pointer positions (global) into canvas coordinates.
  final _worldKey = GlobalKey();

  /// Receives the Delete key.
  final _focus = FocusNode(debugLabel: 'patchbay');

  /// Link being dragged from a port, null when none. Repaints only its own layer.
  final _draft = ValueNotifier<LinkDraft?>(null);

  /// Layout position of every placed node: set once, then changed only by dragging.
  final _positions = <int, Offset>{};

  /// Measured size and port anchors of every node, reported by the boxes.
  final _geometry = <int, NodeGeometry>{};

  /// Size of the visible area, used to zoom around its centre.
  Size _viewport = Size.zero;

  /// At most one of the two is selected.
  int? _selectedLinkId;
  int? _selectedNodeId;

  @override
  void initState() {
    super.initState();
    _sync(widget.view);
  }

  @override
  void didUpdateWidget(PatchbayCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.view != oldWidget.view) {
      _sync(widget.view);
    }
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    _transform.dispose();
    _focus.dispose();
    _draft.dispose();
    super.dispose();
  }

  /// Forgets the nodes and the selected link / node that disappeared, places the new nodes if
  /// already measured.
  void _sync(PatchbayView view) {
    final ids = {for (final node in view.nodes) node.id};
    final placed = _positions.length;
    _positions.removeWhere((id, _) => !ids.contains(id));
    if (_positions.length != placed) {
      _scheduleSave();
    }
    _geometry.removeWhere((id, _) => !ids.contains(id));
    _selectedLinkId = view.links.any((link) => link.id == _selectedLinkId) ? _selectedLinkId : null;
    _selectedNodeId = ids.contains(_selectedNodeId) ? _selectedNodeId : null;
    _placePending(view);
  }

  /// Places the nodes without a position once every node has been measured
  /// (the first layout needs all the sizes): a saved position first, else the layout around the
  /// nodes already placed. Placed nodes never move.
  void _placePending(PatchbayView view) {
    if (view.nodes.every((n) => _geometry.containsKey(n.id))) {
      final placed = _positions.length;
      for (final node in view.nodes.where((n) => !_positions.containsKey(n.id))) {
        if (_restorable.remove(node.key) case final Offset saved) {
          _positions[node.id] = saved;
        }
      }
      final sizes = {for (final entry in _geometry.entries) entry.key: entry.value.size};
      _positions.addAll(placeNewNodes(view, _positions, sizes));
      if (_positions.length != placed) {
        _scheduleSave();
      }
      if (_firstView && _positions.isNotEmpty) {
        _firstView = false;
        WidgetsBinding.instance.addPostFrameCallback((_) => _showBelowToolbars());
      }
    }
  }

  void _scheduleSave() {
    _saveTimer?.cancel();
    _saveTimer = Timer(_saveDelay, _reportPositions);
  }

  /// Positions of the nodes on the canvas now, by key; nothing while none is placed.
  void _reportPositions() {
    if (mounted && _positions.isNotEmpty) {
      widget.onPositionsChanged({
        for (final node in widget.view.nodes)
          if (_positions[node.id] case final Offset position) node.key: position,
      });
    }
  }

  /// Moves the view down by the height of the floating toolbars, so the first nodes are not
  /// under them. After the frame: the toolbars are laid out and measurable.
  void _showBelowToolbars() {
    if (mounted) {
      _transform.value = Matrix4.translationValues(0, _overlayBottom(), 0).multiplied(_transform.value);
    }
  }

  /// Lowest edge of the floating toolbars, from the top of the canvas.
  double _overlayBottom() =>
      [_toolbarKey, _zoomKey].map((key) => key.currentContext?.size?.height ?? 0.0).fold<double>(0, (a, b) => math.max(a, b)) +
      _overlayMargin;

  void _onGeometry(int nodeId, NodeGeometry geometry) {
    if (mounted && _geometry[nodeId] != geometry) {
      setState(() {
        _geometry[nodeId] = geometry;
        _placePending(widget.view);
      });
    }
  }

  /// Placed nodes in world coordinates.
  Map<int, Offset> _worldPositions() => {for (final entry in _positions.entries) entry.key: entry.value + _origin};

  /// Every port of the placed nodes in world coordinates.
  Map<int, PortAnchor> _anchors() => portAnchors(widget.view, _worldPositions(), _geometry);

  @override
  Widget build(BuildContext context) {
    final view = widget.view;
    final world = _worldPositions();

    return CallbackShortcuts(
      bindings: {const SingleActivator(LogicalKeyboardKey.delete): _deleteSelected},
      child: Focus(
        focusNode: _focus,
        child: ColoredBox(
          color: PatchbayColors.canvas,
          child: LayoutBuilder(
            builder: (context, constraints) {
              _viewport = constraints.biggest;
              return Stack(
                children: [
                  Positioned.fill(
                    child: InteractiveViewer(
                      transformationController: _transform,
                      constrained: false,
                      minScale: _minScale,
                      maxScale: _maxScale,
                      child: SizedBox(
                        key: _worldKey,
                        width: _world,
                        height: _world,
                        child: Stack(
                          children: [
                            // Under the nodes: clicks here select a link or deselect.
                            Positioned.fill(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTapUp: (details) => _selectAt(details.localPosition),
                                child: CustomPaint(
                                  painter: PatchbayLinksPainter(
                                    links: view.links,
                                    anchors: portAnchors(view, world, _geometry),
                                    internalLinks: internalAnchors(view, world, _geometry),
                                    selectedLinkId: _selectedLinkId,
                                  ),
                                ),
                              ),
                            ),
                            for (final node in view.nodes)
                              if (world[node.id] case final Offset position) _placed(node, position) else _measuring(node),
                            // Above the nodes, like qpwgraph; never takes the pointer. Own layer:
                            // following the pointer repaints only this curve.
                            Positioned.fill(
                              child: IgnorePointer(
                                child: RepaintBoundary(child: CustomPaint(painter: PatchbayDraftLinkPainter(_draft))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _overlayMargin,
                    left: _overlayMargin,
                    child: KeyedSubtree(key: _toolbarKey, child: widget.toolbar),
                  ),
                  Positioned(
                    top: _overlayMargin,
                    right: _overlayMargin,
                    child: KeyedSubtree(key: _zoomKey, child: _zoomButtons()),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _placed(PatchbayNode node, Offset position) {
    return Positioned(
      key: ValueKey(node.id),
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        // On press, wherever inside the box (header, ports, volume bar), like qpwgraph.
        onPanDown: (_) => _selectNode(node.id),
        onPanUpdate: (details) => _move(node.id, details.delta),
        onPanEnd: (_) => _scheduleSave(),
        child: PatchbayNodeBox(node: node, selected: node.id == _selectedNodeId, onGeometry: _onGeometry, portBuilder: _port),
      ),
    );
  }

  /// Laid out but not painted nor hit-testable: only to get the box geometry.
  Widget _measuring(PatchbayNode node) {
    return Positioned(
      key: ValueKey(node.id),
      left: 0,
      top: 0,
      child: Offstage(
        child: PatchbayNodeBox(node: node, onGeometry: _onGeometry, portBuilder: _port),
      ),
    );
  }

  Widget _port(PwPort port) {
    return PatchbayPort(
      port: port,
      canLink: (from, to) => widget.view.newLink(from, to) != null,
      onLink: _link,
      onDragStart: _dragStarted,
      onDragUpdate: _dragMoved,
      onDragEnd: _dragEnded,
    );
  }

  /// Zoom out, current zoom (follows the wheel too), zoom in, fit.
  Widget _zoomButtons() {
    return ConsolePanel(
      children: [
        ConsoleIconButton(icon: Icons.remove, tooltip: 'Zoom out', onPressed: () => _zoom(1 / _zoomStep)),
        Center(
          child: ValueListenableBuilder<Matrix4>(
            valueListenable: _transform,
            builder: (context, matrix, _) => Text(
              '${(matrix.getMaxScaleOnAxis() / _baseScale * 100).round()}%',
              style: consoleMono(size: 12, color: ConsoleColors.muted),
            ),
          ),
        ),
        ConsoleIconButton(icon: Icons.add, tooltip: 'Zoom in', onPressed: () => _zoom(_zoomStep)),
        const ConsolePanelDivider(),
        ConsoleIconButton(icon: Icons.fit_screen_outlined, tooltip: 'Fit to screen', onPressed: _fit),
      ],
    );
  }

  /// Shows every placed node, as large as fits within the zoom limits, centred in the area
  /// below the floating toolbars.
  void _fit() {
    final boxes = [
      for (final MapEntry(key: id, value: position) in _positions.entries)
        if (_geometry[id]?.size case final Size size) (position + _origin) & size,
    ];
    final area = Rect.fromLTRB(0, _overlayBottom(), _viewport.width, _viewport.height);
    if (boxes.isNotEmpty && !area.isEmpty) {
      final bounds = boxes.reduce((a, b) => a.expandToInclude(b)).inflate(PatchbayMetrics.canvasPadding);
      final scale = math.min(area.width / bounds.width, area.height / bounds.height).clamp(_minScale, _maxScale).toDouble();
      final offset = area.center - bounds.center * scale;
      _transform.value = Matrix4.translationValues(offset.dx, offset.dy, 0).multiplied(Matrix4.diagonal3Values(scale, scale, 1));
    }
  }

  /// The curve starts at the port anchor and follows the pointer from the first move.
  void _dragStarted(PwPort port) {
    if (_anchors()[port.id] case final PortAnchor anchor) {
      _draft.value = (port: anchor, direction: port.direction, pointer: anchor.offset);
    }
  }

  void _dragMoved(Offset globalPosition) {
    final draft = _draft.value;
    final world = _worldKey.currentContext?.findRenderObject();
    if (draft != null && world is RenderBox) {
      _draft.value = (port: draft.port, direction: draft.direction, pointer: world.globalToLocal(globalPosition));
    }
  }

  void _dragEnded() => _draft.value = null;

  void _link(PwPort from, PwPort to) {
    if (widget.view.newLink(from, to) case (:final output, :final input)) {
      widget.onLink(output, input);
    }
  }

  /// [point] in world coordinates. The tolerance is fixed on screen, so it shrinks in canvas
  /// units when zooming in.
  void _selectAt(Offset point) {
    final tolerance = _linkHitTolerance / _transform.value.getMaxScaleOnAxis();
    setState(() {
      _selectedLinkId = linkAt(widget.view.links, _anchors(), point, tolerance);
      _selectedNodeId = null;
    });
    _focus.requestFocus();
  }

  void _selectNode(int nodeId) {
    if (_selectedNodeId != nodeId || _selectedLinkId != null) {
      setState(() {
        _selectedNodeId = nodeId;
        _selectedLinkId = null;
      });
    }
    _focus.requestFocus();
  }

  /// A link is deselected right away: a second Delete cannot hit a link already being removed.
  /// A node stays selected: removing it may still be cancelled; it is deselected when it disappears.
  void _deleteSelected() {
    if (_selectedLinkId case final int linkId) {
      setState(() => _selectedLinkId = null);
      widget.onUnlink(linkId);
    } else if (widget.view.nodes.where((node) => node.id == _selectedNodeId).firstOrNull case final PatchbayNode node) {
      widget.onDeleteNode(node);
    }
  }

  /// [delta] is already in canvas coordinates (scale of the viewer applied).
  /// Kept inside the world, so a node can never be dragged out of reach.
  void _move(int nodeId, Offset delta) {
    final next = (_positions[nodeId] ?? Offset.zero) + delta;
    final size = _geometry[nodeId]?.size ?? Size.zero;
    setState(() {
      _positions[nodeId] = Offset(
        next.dx.clamp(-_origin.dx, _origin.dx - size.width),
        next.dy.clamp(-_origin.dy, _origin.dy - size.height),
      );
    });
  }

  /// Zooms around the centre of the visible area, within [_minScale]..[_maxScale].
  void _zoom(double factor) {
    final current = _transform.value.getMaxScaleOnAxis();
    final target = (current * factor).clamp(_minScale, _maxScale);
    final step = target / current;
    final center = _viewport.center(Offset.zero);
    final zoom = Matrix4.translationValues(
      center.dx,
      center.dy,
      0,
    ).multiplied(Matrix4.diagonal3Values(step, step, 1)).multiplied(Matrix4.translationValues(-center.dx, -center.dy, 0));
    _transform.value = zoom.multiplied(_transform.value);
  }
}
