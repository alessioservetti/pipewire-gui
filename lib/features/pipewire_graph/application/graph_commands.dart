import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Runs a write command, then waits until the graph reflects it.
/// Used by every feature controller (mixer, patchbay, devices).
Future<void> runGraphCommand(
  Ref ref,
  Future<void> Function(PipewireRepository repository) command,
) async {
  await command(ref.read(pipewireRepositoryProvider));
  ref.invalidate(pipewireGraphProvider);
  await ref.read(pipewireGraphProvider.future);
}
