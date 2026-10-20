import 'package:pipewire_gui/features/pipewire_graph/application/graph_commands.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graph_clock_controller.g.dart';

/// Write side of the graph clock: `settings` metadata through pw-metadata, applied live by
/// PipeWire (no service restarted). State = outcome of the last command.
@Riverpod(keepAlive: true)
class GraphClockController extends _$GraphClockController {
  @override
  FutureOr<void> build() {}

  /// Null → automatic (force-*) or back to the PipeWire config value.
  Future<void> setSetting(ClockSetting setting, int? value) =>
      _execute((repository) => repository.setClockSetting(setting, value));

  /// Empty → back to the PipeWire config value.
  Future<void> setAllowedRates(List<int> rates) =>
      _execute((repository) => repository.setAllowedRates(rates));

  Future<void> _execute(
    Future<void> Function(PipewireRepository repository) command,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => runGraphCommand(ref, command));
  }
}
