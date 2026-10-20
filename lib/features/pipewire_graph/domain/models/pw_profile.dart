import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_profile.freezed.dart';

@freezed
abstract class PwProfile with _$PwProfile {
  const factory PwProfile({
    required int index,
    required String name,
    required String description,
    @Default(true) bool available,
  }) = _PwProfile;
}
