import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_profile.dart';

part 'pw_device.freezed.dart';

@freezed
abstract class PwDevice with _$PwDevice {
  const factory PwDevice({
    required int id,
    required String name,
    required String description,
    @Default(IListConst<PwProfile>([])) IList<PwProfile> profiles,
    int? activeProfileIndex,
  }) = _PwDevice;
}
