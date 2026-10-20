import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_object_dto.freezed.dart';
part 'pw_object_dto.g.dart';

/// Values of the `type` field in `pw-dump` output.
abstract final class PwObjectType {
  static const node = 'PipeWire:Interface:Node';
  static const device = 'PipeWire:Interface:Device';
  static const port = 'PipeWire:Interface:Port';
  static const link = 'PipeWire:Interface:Link';
  static const metadata = 'PipeWire:Interface:Metadata';
  static const client = 'PipeWire:Interface:Client';
}

/// One raw object of the `pw-dump` JSON array.
@freezed
abstract class PwObjectDto with _$PwObjectDto {
  const factory PwObjectDto({
    required int id,

    /// See PwObjectType.
    required String type,

    /// Node/Device/Port/Link data: `info.props`, `info.params`, `info.direction`,
    /// `info.output-port-id`, ...
    Map<String, dynamic>? info,

    /// Metadata objects only: `props["metadata.name"]`.
    Map<String, dynamic>? props,

    /// Metadata objects only: entries `{subject, key, type, value}`.
    List<Map<String, dynamic>>? metadata,
  }) = _PwObjectDto;

  factory PwObjectDto.fromJson(Map<String, Object?> json) =>
      _$PwObjectDtoFromJson(json);
}
