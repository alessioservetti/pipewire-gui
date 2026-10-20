import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/core/process/command_runner.dart';
import 'package:pipewire_gui/core/providers/core_providers.dart';
import 'package:pipewire_gui/features/wireplumber_config/domain/models/wp_config_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wireplumber_config_service.g.dart';

@Riverpod(keepAlive: true)
WireplumberConfigService wireplumberConfigService(Ref ref) =>
    WireplumberConfigService(ref.watch(commandRunnerProvider));

/// WirePlumber user config: files on disk, no polling.
/// No repository here: there is nothing to transform.
class WireplumberConfigService {
  const WireplumberConfigService(this._runner);

  final CommandRunner _runner;

  Directory get configDir => Directory(
        '${Platform.environment['HOME'] ?? ''}/.config/wireplumber/wireplumber.conf.d',
      );

  /// `*.conf` files in [configDir].
  Future<IList<WpConfigFile>> listFiles() async {
    // TODO
    throw UnimplementedError();
  }

  Future<String> readFile(String path) async {
    // TODO
    throw UnimplementedError();
  }

  Future<void> writeFile(String name, String content) async {
    // TODO: create configDir if missing, write [name] (.conf)
    throw UnimplementedError();
  }

  Future<void> deleteFile(String path) async {
    // TODO
    throw UnimplementedError();
  }

  /// `systemctl --user restart wireplumber`
  Future<void> restartWireplumber() =>
      _runner.run('systemctl', const ['--user', 'restart', 'wireplumber']);
}
