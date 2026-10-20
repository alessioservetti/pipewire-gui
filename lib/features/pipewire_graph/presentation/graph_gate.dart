import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';

/// Shows [child] once the first snapshot is available, loader/error before.
/// Watches only hasValue/error, so it does not rebuild on every poll.
class GraphGate extends ConsumerWidget {
  const GraphGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasValue = ref.watch(pipewireGraphProvider.select((s) => s.hasValue));
    final error = ref.watch(pipewireGraphProvider.select((s) => s.error));

    if (hasValue) {
      return child;
    }
    if (error != null) {
      return Center(child: Text('$error'));
    }
    return const Center(child: CircularProgressIndicator());
  }
}
