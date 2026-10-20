import 'package:freezed_annotation/freezed_annotation.dart';

part 'pactl_module_dto.freezed.dart';

/// One line of `pactl list modules short`: `index \t name \t argument`.
/// For pipewire-pulse modules `index` equals the `pulse.module.id` property
/// of the nodes the module created.
@freezed
abstract class PactlModuleDto with _$PactlModuleDto {
  const factory PactlModuleDto({
    required int index,
    required String name,

    /// Raw argument string, e.g. `source_name=X master=Y.monitor rate=48000`.
    required String argument,
  }) = _PactlModuleDto;
}
