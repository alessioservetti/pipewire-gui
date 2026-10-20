import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/driver_rates_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graph_clock_providers.g.dart';

/// A driver the profiler sees running: its node and the rate its whole group runs at.
typedef RunningDriver = ({int id, String name, int rate});

/// Clock entries of the `settings` metadata (requested values).
@riverpod
ClockSettings clockSettings(Ref ref) =>
    ref.watch(pipewireGraphProvider.select((s) => s.value?.clock)) ?? const ClockSettings();

/// What the graph really runs at now, one entry per running driver (pw-top profiler), sorted by
/// name. Empty when the graph is idle.
@riverpod
IList<RunningDriver> runningDrivers(Ref ref) {
  final rates = ref.watch(driverRatesProvider.select((s) => s.value)) ?? const IMapConst<int, int>({});
  final graph = ref.watch(pipewireGraphProvider.select((s) => s.value));
  return [
    for (final MapEntry(key: id, value: rate) in rates.entries)
      (id: id, name: graph?.nodeById(id)?.description ?? 'Driver $id', rate: rate),
  ].lock.sort((a, b) => a.name.compareTo(b.name));
}
