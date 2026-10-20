import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/features/wireplumber_config/data/wireplumber_config_service.dart';
import 'package:pipewire_gui/features/wireplumber_config/domain/models/wp_config_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wp_config_providers.g.dart';

/// autoDispose (default): loaded when the page opens, released when it closes.
@riverpod
Future<IList<WpConfigFile>> wpConfigFiles(Ref ref) =>
    ref.watch(wireplumberConfigServiceProvider).listFiles();

@Riverpod(keepAlive: true)
class WpConfigController extends _$WpConfigController {
  @override
  FutureOr<void> build() {}

  Future<void> save(String name, String content) => _execute(() async {
        await ref.read(wireplumberConfigServiceProvider).writeFile(name, content);
        ref.invalidate(wpConfigFilesProvider);
      });

  Future<void> delete(String path) => _execute(() async {
        await ref.read(wireplumberConfigServiceProvider).deleteFile(path);
        ref.invalidate(wpConfigFilesProvider);
      });

  Future<void> restartWireplumber() => _execute(
        () => ref.read(wireplumberConfigServiceProvider).restartWireplumber(),
      );

  Future<void> _execute(Future<void> Function() command) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(command);
  }
}
