import 'package:pipewire_gui/features/pipewire_graph/application/graph_commands.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'devices_controller.g.dart';

@Riverpod(keepAlive: true)
class DevicesController extends _$DevicesController {
  @override
  FutureOr<void> build() {}

  Future<void> setProfile(int deviceId, int profileIndex) =>
      _execute((repository) => repository.setProfile(deviceId, profileIndex));

  Future<void> _execute(
    Future<void> Function(PipewireRepository repository) command,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => runGraphCommand(ref, command));
  }
}
