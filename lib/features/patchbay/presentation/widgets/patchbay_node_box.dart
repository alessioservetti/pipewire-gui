import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/patchbay/application/patchbay_controller.dart';
import 'package:pipewire_gui/features/patchbay/domain/models/patchbay_view.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_layout.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/patchbay_volume_bar.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

/// Node box: header (title, rate, default star for sinks/sources, type icon), volume bar when the
/// node has a volume, then inputs on the left edge and outputs on the right edge, row by row
/// (row i = input i | output i), like qpwgraph. The default sink / source has a highlighted border,
/// the selected node a glow around it (outside the box: its size does not change).
///
/// Sizes itself from its content: add anything to the header or the rows, nothing else to change.
/// After each layout it measures its size and where every port sits on its edge, and reports them
/// with [onGeometry] when they change; the canvas uses them to place the box and attach the links.
/// Ports are built by [portBuilder] (the canvas wires them for link drag and drop).
class PatchbayNodeBox extends StatefulWidget {
  const PatchbayNodeBox({
    super.key,
    required this.node,
    required this.onGeometry,
    required this.portBuilder,
    this.selected = false,
  });

  final PatchbayNode node;
  final bool selected;
  final void Function(int nodeId, NodeGeometry geometry) onGeometry;
  final Widget Function(PwPort port) portBuilder;

  @override
  State<PatchbayNodeBox> createState() => _PatchbayNodeBoxState();
}

class _PatchbayNodeBoxState extends State<PatchbayNodeBox> {
  final _boxKey = GlobalKey();
  final _portKeys = <int, GlobalKey>{};
  NodeGeometry? _reported;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());

    final node = widget.node;
    final rows = math.max(node.inputs.length, node.outputs.length);

    return Container(
      key: _boxKey,
      width: PatchbayMetrics.nodeWidth,
      decoration: BoxDecoration(
        color: PatchbayColors.nodeBody,
        border: node.isDefault
            ? Border.all(color: PatchbayColors.defaultNode, width: 2)
            : Border.all(color: PatchbayColors.nodeBorder),
        borderRadius: BorderRadius.circular(4),
        boxShadow: widget.selected
            ? const [BoxShadow(color: PatchbayColors.nodeSelection, blurRadius: 10, spreadRadius: 1)]
            : const [BoxShadow(color: Colors.black54, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(node),
          if (node.hasVolume) PatchbayVolumeBar(nodeId: node.id),
          for (var row = 0; row < rows; row++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Row(
                children: [
                  Expanded(
                    child: Align(alignment: Alignment.centerLeft, child: row < node.inputs.length ? _chip(node.inputs[row]) : null),
                  ),
                  Expanded(
                    child: Align(alignment: Alignment.centerRight, child: row < node.outputs.length ? _chip(node.outputs[row]) : null),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _header(PatchbayNode node) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  node.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: PatchbayColors.nodeTitle, fontSize: 11, fontWeight: FontWeight.w600),
                ),
                ..._rateLines(node),
              ],
            ),
          ),
          if (node.type == PwNodeType.audioSink || node.type == PwNodeType.audioSource)
            _DefaultButton(nodeId: node.id, isDefault: node.isDefault),
          const SizedBox(width: 8),
          _nodeTypeIcon(node.type),
        ],
      ),
    );
  }

  /// - `48000 → 44100 Hz · resampling` (highlighted): own rate ≠ graph rate, arrow = audio flow;
  /// - `44100 Hz`: own rate = graph rate, no conversion;
  /// - `44100 Hz (graph)`: no own rate (DSP node, e.g. remap/loopback), runs at the graph rate;
  /// - `requested 48000 Hz`: pactl module rate that is not the one in effect.
  List<Widget> _rateLines(PatchbayNode node) {
    final effective = node.graphRate ?? node.rate;
    return [
      if (node.resampling)
        _rateText(_resamplingLabel(node), PatchbayColors.resampling)
      else if (node.rate case final int rate)
        _rateText('$rate Hz', PatchbayColors.nodeTitle)
      else if (node.graphRate case final int graph)
        _rateText('$graph Hz (graph)', PatchbayColors.nodeTitle),
      if (node.requestedRate case final int requested when requested != effective)
        _rateText('requested $requested Hz', PatchbayColors.nodeTitle),
    ];
  }

  /// Producers (output streams, sources) convert own rate → graph; consumers graph → own rate.
  String _resamplingLabel(PatchbayNode node) => switch (node.type) {
    PwNodeType.audioStreamOutput || PwNodeType.audioSource => '${node.rate} → ${node.graphRate} Hz · resampling',
    _ => '${node.graphRate} → ${node.rate} Hz · resampling',
  };

  Widget _rateText(String text, Color color) => Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w400),
  );

  /// Keyed to find the port when measuring its anchor.
  Widget _chip(PwPort port) => KeyedSubtree(key: _portKeys.putIfAbsent(port.id, () => GlobalKey()), child: widget.portBuilder(port));

  /// Size of the box and, for every port, its centre on the box edge (x = 0 for inputs,
  /// x = width for outputs), relative to the box. Reported only when it changes.
  void _measure() {
    final box = _boxKey.currentContext?.findRenderObject();
    if (mounted && box is RenderBox && box.hasSize) {
      final anchors = <int, Offset>{
        for (final port in widget.node.inputs)
          if (_portCenterY(port.id, box) case final double y) port.id: Offset(0, y),
        for (final port in widget.node.outputs)
          if (_portCenterY(port.id, box) case final double y) port.id: Offset(box.size.width, y),
      };
      final geometry = (size: box.size, anchors: anchors.lock);
      if (geometry != _reported) {
        _reported = geometry;
        widget.onGeometry(widget.node.id, geometry);
      }
    }
  }

  double? _portCenterY(int portId, RenderBox box) {
    final chip = _portKeys[portId]?.currentContext?.findRenderObject();
    if (chip is RenderBox && chip.hasSize) {
      return chip.localToGlobal(Offset(0, chip.size.height / 2), ancestor: box).dy;
    }
    return null;
  }

  Icon _nodeTypeIcon(PwNodeType type) {
    switch (type) {
      case PwNodeType.audioSink:
        return const Icon(Icons.speaker, size: 16, color: Colors.green);
      case PwNodeType.audioSource:
        return const Icon(Icons.settings_input_component, size: 16, color: Colors.blue);
      case PwNodeType.audioDuplex:
        return const Icon(Icons.headset_mic, size: 16, color: Colors.purple);
      case PwNodeType.audioStreamOutput:
        return const Icon(Icons.music_note, size: 16, color: Colors.orange);
      case PwNodeType.audioStreamInput:
        return const Icon(Icons.mic, size: 16, color: Colors.lightBlueAccent);
      case PwNodeType.midiBridge:
        return const Icon(Icons.piano, size: 16, color: Colors.red);
      case PwNodeType.video:
        return const Icon(Icons.videocam, size: 16, color: Colors.deepPurple);
      case PwNodeType.other:
        return const Icon(Icons.device_unknown, size: 16, color: Colors.grey);
    }
  }
}

/// Star of a sink / source: filled on the default one, sets it as default otherwise
/// (`wpctl set-default`: default sink or default source, depending on the node).
class _DefaultButton extends ConsumerWidget {
  const _DefaultButton({required this.nodeId, required this.isDefault});

  final int nodeId;
  final bool isDefault;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: isDefault ? 'Default' : 'Set as default',
      icon: Icon(isDefault ? Icons.star : Icons.star_border),
      iconSize: 16,
      color: PatchbayColors.nodeTitle,
      disabledColor: PatchbayColors.defaultNode,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: isDefault ? null : () => ref.read(patchbayControllerProvider.notifier).setDefault(nodeId),
    );
  }
}
