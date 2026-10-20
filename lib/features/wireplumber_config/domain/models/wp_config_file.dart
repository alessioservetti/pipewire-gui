import 'package:freezed_annotation/freezed_annotation.dart';

part 'wp_config_file.freezed.dart';

/// A drop-in file in ~/.config/wireplumber/wireplumber.conf.d
@freezed
abstract class WpConfigFile with _$WpConfigFile {
  const factory WpConfigFile({
    required String name,
    required String path,
  }) = _WpConfigFile;
}
