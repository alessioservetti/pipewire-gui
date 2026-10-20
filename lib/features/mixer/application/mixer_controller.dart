import 'package:pipewire_gui/features/pipewire_graph/application/graph_commands.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mixer_controller.g.dart';

/// Write side of the mixer. State = outcome of the last command
/// (loading / error), listened by the page to show errors.
@Riverpod(keepAlive: true)
class MixerController extends _$MixerController {
  @override
  FutureOr<void> build() {}

  Future<void> setVolume(int nodeId, double volume) =>
      _execute((repository) => repository.setVolume(nodeId, volume));

  Future<void> toggleMute(int nodeId) =>
      _execute((repository) => repository.toggleMute(nodeId));

  Future<void> setDefault(int nodeId) =>
      _execute((repository) => repository.setDefault(nodeId));

  Future<void> _execute(
    Future<void> Function(PipewireRepository repository) command,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => runGraphCommand(ref, command));
  }
}
