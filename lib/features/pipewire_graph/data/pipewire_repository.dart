import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/core/providers/core_providers.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/dto/pactl_module_dto.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/services/pipewire_cli_service.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/transformers/pw_graph_transformer.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/graph_snapshot.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/virtual_node_spec.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pipewire_repository.g.dart';

@Riverpod(keepAlive: true)
PipewireRepository pipewireRepository(Ref ref) =>
    PipewireRepository(PipewireCliService(ref.watch(commandRunnerProvider)));

/// Single entry point to read and change the PipeWire graph.
class PipewireRepository {
  const PipewireRepository(this._service);

  final PipewireCliService _service;

  /// `pw-dump` and `pactl` run in parallel.
  Future<GraphSnapshot> fetchGraph() async {
    final modules = _pulseModules();
    final objects = await _service.dump();
    return PwGraphTransformer.toSnapshot(objects, await modules);
  }

  /// Graph rate of every active driver (driver id → rate), live from the PipeWire profiler.
  Stream<IMap<int, int>> watchDriverRates() => _service.driverRates().map((rates) => rates.lock);

  /// [volume] in wpctl scale, 1.0 = 100%.
  Future<void> setVolume(int nodeId, double volume) =>
      _service.wpctl(['set-volume', '$nodeId', volume.toStringAsFixed(3)]);

  Future<void> toggleMute(int nodeId) =>
      _service.wpctl(['set-mute', '$nodeId', 'toggle']);

  Future<void> setDefault(int nodeId) =>
      _service.wpctl(['set-default', '$nodeId']);

  Future<void> setProfile(int deviceId, int profileIndex) =>
      _service.wpctl(['set-profile', '$deviceId', '$profileIndex']);

  Future<void> link(int outputPortId, int inputPortId) =>
      _service.pwLink(['$outputPortId', '$inputPortId']);

  Future<void> unlink(int linkId) => _service.pwLink(['-d', '$linkId']);

  /// `pactl load-module <module> <args>`: the node lives until the module is unloaded or
  /// pipewire-pulse restarts.
  Future<void> createVirtualNode(VirtualNodeSpec spec) =>
      _service.pactl(['load-module', spec.moduleName, ...spec.moduleArguments]);

  /// Removes every node kept alive by [owner]:
  /// - pactl module → `pactl unload-module <index>`;
  /// - pw-loopback → `pw-cli destroy <client id>`: the process gets disconnected and exits
  ///   (its loopback module tears down on the lost connection, pw-loopback quits with it).
  Future<void> removeNodes(NodeOwner owner) async {
    switch (owner) {
      case ModuleOwner(:final module):
        await _service.pactl(['unload-module', '${module.index}']);
      case LoopbackProcessOwner(:final clientId):
        await _service.pwCli(['destroy', '$clientId']);
    }
  }

  /// `pw-metadata -n settings 0 <key> <value>`: applied live by PipeWire, nothing restarts.
  /// Null writes 0: automatic (force-*) or back to the PipeWire config value. Runtime only: a
  /// PipeWire restart goes back to the config.
  Future<void> setClockSetting(ClockSetting setting, int? value) =>
      _service.pwMetadata(['-n', 'settings', '0', setting.key, '${value ?? 0}']);

  /// `clock.allowed-rates` as `[ 44100, 48000 ]`; an empty list goes back to the config value.
  Future<void> setAllowedRates(List<int> rates) =>
      _service.pwMetadata(['-n', 'settings', '0', 'clock.allowed-rates', '[ ${rates.join(', ')} ]']);

  /// Module arguments are optional data: without pactl (pulseaudio-utils)
  /// or pipewire-pulse the graph still loads, just without them.
  Future<List<PactlModuleDto>> _pulseModules() async {
    try {
      return await _service.pulseModules();
    } on Exception {
      return const [];
    }
  }
}
