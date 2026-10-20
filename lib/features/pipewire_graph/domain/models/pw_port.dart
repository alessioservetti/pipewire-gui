import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_port.freezed.dart';

enum PortDirection { input, output }

enum PortMediaType { audio, midi, video, other }

@freezed
abstract class PwPort with _$PwPort {
  const factory PwPort({
    required int id,
    required int nodeId,

    /// `port.name`
    required String name,
    required PortDirection direction,

    /// `port.id`: position among the node's ports of the same direction.
    @Default(0) int index,

    /// From `format.dsp` ("32 bit float mono audio", "8 bit raw midi", ...).
    @Default(PortMediaType.other) PortMediaType mediaType,

    /// `audio.channel` (FL, FR, ...), null for MIDI/video.
    String? channel,
  }) = _PwPort;
}
