import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_settings.freezed.dart';

/// Clock entries of the `settings` metadata (subject 0), as PipeWire exposes them.
///
/// These are the requested values: PipeWire applies them live, but ignores a force-rate not in
/// [allowedRates] and a force-quantum outside [minQuantum]..[maxQuantum]. The rate the graph
/// really runs at comes from the profiler (driver rates), not from here.
@freezed
abstract class ClockSettings with _$ClockSettings {
  const factory ClockSettings({
    /// `clock.rate`: default graph rate, used when nothing asks for another one.
    int? rate,

    /// `clock.allowed-rates`: rates the graph may switch to (when the driver is idle).
    @Default(IListConst<int>([])) IList<int> allowedRates,

    /// `clock.force-rate`; null = automatic (0).
    int? forceRate,

    /// `clock.quantum`: default buffer size in samples.
    int? quantum,

    /// `clock.min-quantum`
    int? minQuantum,

    /// `clock.max-quantum`
    int? maxQuantum,

    /// `clock.force-quantum`; null = automatic (0).
    int? forceQuantum,
  }) = _ClockSettings;
}

/// Integer clock settings PipeWire applies live when written to the `settings` metadata
/// (src/pipewire/settings.c), no restart. Writing 0 means: back to automatic (force-*) or to the
/// value of the PipeWire config (the others).
enum ClockSetting {
  rate('clock.rate'),
  forceRate('clock.force-rate'),
  quantum('clock.quantum'),
  minQuantum('clock.min-quantum'),
  maxQuantum('clock.max-quantum'),
  forceQuantum('clock.force-quantum');

  const ClockSetting(this.key);

  /// Metadata key.
  final String key;
}
