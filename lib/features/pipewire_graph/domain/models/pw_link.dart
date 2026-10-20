import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_link.freezed.dart';

@freezed
abstract class PwLink with _$PwLink {
  const factory PwLink({
    required int id,
    required int outputNodeId,
    required int outputPortId,
    required int inputNodeId,
    required int inputPortId,
    @Default(true) bool active,
  }) = _PwLink;
}
