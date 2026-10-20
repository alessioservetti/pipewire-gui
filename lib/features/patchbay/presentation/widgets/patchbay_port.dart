import 'package:flutter/material.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

/// A port of a node box, and both ends of a new link (like qpwgraph):
/// - dragging it starts a link: [onDragStart], [onDragUpdate] (global pointer) and [onDragEnd]
///   let the canvas draw the curve following the pointer;
/// - dropping another port on it: highlighted while hovered if [canLink], [onLink] on release.
///
/// Works from either end: output → input or input → output.
class PatchbayPort extends StatelessWidget {
  const PatchbayPort({
    super.key,
    required this.port,
    required this.canLink,
    required this.onLink,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
  });

  final PwPort port;

  /// [from] is the dragged port, [to] this one.
  final bool Function(PwPort from, PwPort to) canLink;
  final void Function(PwPort from, PwPort to) onLink;
  final void Function(PwPort port) onDragStart;
  final void Function(Offset globalPosition) onDragUpdate;
  final VoidCallback onDragEnd;

  @override
  Widget build(BuildContext context) {
    return Draggable<PwPort>(
      data: port,
      maxSimultaneousDrags: 1,
      // The canvas draws the link curve; nothing follows the pointer.
      feedback: const SizedBox.shrink(),
      onDragStarted: () => onDragStart(port),
      onDragUpdate: (details) => onDragUpdate(details.globalPosition),
      onDragEnd: (_) => onDragEnd(),
      child: DragTarget<PwPort>(
        onWillAcceptWithDetails: (details) => canLink(details.data, port),
        onAcceptWithDetails: (details) => onLink(details.data, port),
        builder: (context, candidates, rejected) => _PortChip(port: port, highlighted: candidates.isNotEmpty),
      ),
    );
  }
}

class _PortChip extends StatelessWidget {
  const _PortChip({required this.port, required this.highlighted});

  final PwPort port;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: PatchbayMetrics.nodeWidth / 2 - 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: PatchbayColors.portFill(port.mediaType),
        border: Border.all(color: highlighted ? PatchbayColors.portHighlight : PatchbayColors.portBorder(port.mediaType)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        port.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: PatchbayColors.portText, fontSize: 10),
      ),
    );
  }
}
