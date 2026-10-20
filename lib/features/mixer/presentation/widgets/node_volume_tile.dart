import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/mixer/application/mixer_controller.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/graph_selectors.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';

class NodeVolumeTile extends ConsumerStatefulWidget {
  const NodeVolumeTile({super.key, required this.nodeId});

  final int nodeId;

  @override
  ConsumerState<NodeVolumeTile> createState() => _NodeVolumeTileState();
}

class _NodeVolumeTileState extends ConsumerState<NodeVolumeTile> {
  static const _maxVolume = 1.0;

  /// Local value while dragging: polling must not move the thumb
  /// under the cursor.
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final node = ref.watch(pwNodeProvider(widget.nodeId));

    if (node != null) {
      final value = (_dragValue ?? node.volume).clamp(0.0, _maxVolume);
      final details = _details(node);

      return ListTile(
        leading: IconButton(
          icon: Icon(node.mute ? Icons.volume_off : Icons.volume_up),
          onPressed: () => ref.read(mixerControllerProvider.notifier).toggleMute(node.id),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(node.description),
            if (details.isNotEmpty)
              Tooltip(
                message: _arguments(node),
                child: Text(details, style: Theme.of(context).textTheme.bodySmall),
              ),
          ],
        ),
        subtitle: Slider(
          value: value,
          max: _maxVolume,
          onChanged: (v) => setState(() => _dragValue = v),
          // TODO: throttle setVolume in onChanged (~50 ms) for live feedback.
          onChangeEnd: (v) => _commit(node.id, v),
        ),
        trailing: Text('${(value * 100).round()}%'),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _commit(int nodeId, double volume) async {
    await ref.read(mixerControllerProvider.notifier).setVolume(nodeId, volume);
    if (mounted) {
      setState(() => _dragValue = null);
    }
  }
}

/// e.g. "44100 Hz · module-null-sink" or "module-remap-source · rate=48000".
String _details(PwNode node) => [
  if (node.rate case final int rate) '$rate Hz',
  if (node.module?.name case final String module) module,
  if (node.module?.arguments['rate'] case final String rate) 'rate=$rate',
].join(' · ');

/// All creation arguments of the module, one per line (empty: no tooltip).
String _arguments(PwNode node) =>
    [for (final entry in node.module?.arguments.entries ?? const <MapEntry<String, String>>[]) '${entry.key}=${entry.value}'].join('\n');
