import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/mixer/application/mixer_controller.dart';
import 'package:pipewire_gui/features/mixer/presentation/widgets/node_volume_tile.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/graph_selectors.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/media_class.dart';
import 'package:pipewire_gui/features/pipewire_graph/presentation/graph_gate.dart';

class MixerPage extends ConsumerWidget {
  const MixerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(mixerControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${next.error}')));
      }
    });

    return GraphGate(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ClockRate(),
          _NodeSection(title: 'Outputs', mediaClass: MediaClass.audioSink),
          _NodeSection(title: 'Inputs', mediaClass: MediaClass.audioSource),
          _NodeSection(title: 'Applications', mediaClass: MediaClass.streamOutputAudio),
        ],
      ),
    );
  }
}

class _ClockRate extends ConsumerWidget {
  const _ClockRate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockRate = ref.watch(clockRateProvider);

    if (clockRate != null) {
      return Text(
        'Graph clock: $clockRate Hz',
        style: Theme.of(context).textTheme.labelLarge,
      );
    }
    return const SizedBox.shrink();
  }
}

class _NodeSection extends ConsumerWidget {
  const _NodeSection({required this.title, required this.mediaClass});

  final String title;
  final String mediaClass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(nodeIdsByClassProvider(mediaClass));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        for (final id in ids) NodeVolumeTile(key: ValueKey(id), nodeId: id),
      ],
    );
  }
}
