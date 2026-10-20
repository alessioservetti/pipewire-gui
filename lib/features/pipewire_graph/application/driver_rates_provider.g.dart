// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_rates_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Graph rate of every active driver (driver id → rate), measured by the PipeWire profiler
/// through a long-running `pw-top -b`. Event-driven (one update per profiler cycle), no polling.
/// Identical tables are `==` (IMap), so nobody is notified when nothing changes.

@ProviderFor(driverRates)
final driverRatesProvider = DriverRatesProvider._();

/// Graph rate of every active driver (driver id → rate), measured by the PipeWire profiler
/// through a long-running `pw-top -b`. Event-driven (one update per profiler cycle), no polling.
/// Identical tables are `==` (IMap), so nobody is notified when nothing changes.

final class DriverRatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<int, int>>,
          IMap<int, int>,
          Stream<IMap<int, int>>
        >
    with $FutureModifier<IMap<int, int>>, $StreamProvider<IMap<int, int>> {
  /// Graph rate of every active driver (driver id → rate), measured by the PipeWire profiler
  /// through a long-running `pw-top -b`. Event-driven (one update per profiler cycle), no polling.
  /// Identical tables are `==` (IMap), so nobody is notified when nothing changes.
  DriverRatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driverRatesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driverRatesHash();

  @$internal
  @override
  $StreamProviderElement<IMap<int, int>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<int, int>> create(Ref ref) {
    return driverRates(ref);
  }
}

String _$driverRatesHash() => r'9ed31d2ed1a6428528b0477f1b882791be41da7f';
