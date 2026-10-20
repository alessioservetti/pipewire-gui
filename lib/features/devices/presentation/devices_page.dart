import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/graph_selectors.dart';
import 'package:pipewire_gui/features/pipewire_graph/presentation/graph_gate.dart';

class DevicesPage extends ConsumerWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(graphDevicesProvider);

    // TODO: profile selector per device → devicesControllerProvider.setProfile.
    return GraphGate(
      child: ListView(
        children: [
          for (final device in devices)
            ListTile(
              title: Text(device.description),
              subtitle: Text(device.name),
            ),
        ],
      ),
    );
  }
}
