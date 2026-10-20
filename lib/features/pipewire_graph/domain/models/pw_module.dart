import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_module.freezed.dart';

/// pipewire-pulse module that created a node (`pactl load-module ...`).
@freezed
abstract class PwModule with _$PwModule {
  const factory PwModule({
    /// Module index in pactl, equal to the node's `pulse.module.id`.
    required int index,

    /// e.g. `module-remap-source`, `module-null-sink`.
    required String name,

    /// Creation arguments: `rate`, `channels`, `channel_map`, `master`, ...
    @Default(IMapConst<String, String>({})) IMap<String, String> arguments,
  }) = _PwModule;
}
