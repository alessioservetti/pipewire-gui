// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_clock_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Clock entries of the `settings` metadata (requested values).

@ProviderFor(clockSettings)
final clockSettingsProvider = ClockSettingsProvider._();

/// Clock entries of the `settings` metadata (requested values).

final class ClockSettingsProvider
    extends $FunctionalProvider<ClockSettings, ClockSettings, ClockSettings>
    with $Provider<ClockSettings> {
  /// Clock entries of the `settings` metadata (requested values).
  ClockSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockSettingsHash();

  @$internal
  @override
  $ProviderElement<ClockSettings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClockSettings create(Ref ref) {
    return clockSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClockSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClockSettings>(value),
    );
  }
}

String _$clockSettingsHash() => r'f75766894ca01599f756a2022ada9f8ce3cd2c13';

/// What the graph really runs at now, one entry per running driver (pw-top profiler), sorted by
/// name. Empty when the graph is idle.

@ProviderFor(runningDrivers)
final runningDriversProvider = RunningDriversProvider._();

/// What the graph really runs at now, one entry per running driver (pw-top profiler), sorted by
/// name. Empty when the graph is idle.

final class RunningDriversProvider
    extends
        $FunctionalProvider<
          IList<RunningDriver>,
          IList<RunningDriver>,
          IList<RunningDriver>
        >
    with $Provider<IList<RunningDriver>> {
  /// What the graph really runs at now, one entry per running driver (pw-top profiler), sorted by
  /// name. Empty when the graph is idle.
  RunningDriversProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'runningDriversProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$runningDriversHash();

  @$internal
  @override
  $ProviderElement<IList<RunningDriver>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IList<RunningDriver> create(Ref ref) {
    return runningDrivers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<RunningDriver> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<RunningDriver>>(value),
    );
  }
}

String _$runningDriversHash() => r'3b4e4152e43a394f61a6c1ddeb74a744375acb6e';
