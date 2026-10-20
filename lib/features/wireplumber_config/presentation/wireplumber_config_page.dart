import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/wireplumber_config/application/wp_config_providers.dart';

class WireplumberConfigPage extends ConsumerWidget {
  const WireplumberConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(wpConfigFilesProvider);

    // TODO: editor for the selected file → wpConfigControllerProvider.save.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: () => ref
                  .read(wpConfigControllerProvider.notifier)
                  .restartWireplumber(),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart WirePlumber'),
            ),
          ),
        ),
        Expanded(
          child: files.when(
            data: (items) => ListView(
              children: [
                for (final file in items)
                  ListTile(title: Text(file.name), subtitle: Text(file.path)),
              ],
            ),
            error: (error, _) => Center(child: Text('$error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
