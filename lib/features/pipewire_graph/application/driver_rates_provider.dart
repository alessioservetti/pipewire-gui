import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_rates_provider.g.dart';

/// Graph rate of every active driver (driver id → rate), measured by the PipeWire profiler
/// through a long-running `pw-top -b`. Event-driven (one update per profiler cycle), no polling.
/// Identical tables are `==` (IMap), so nobody is notified when nothing changes.
@Riverpod(keepAlive: true)
Stream<IMap<int, int>> driverRates(Ref ref) => ref.watch(pipewireRepositoryProvider).watchDriverRates();
