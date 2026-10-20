// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wp_config_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// autoDispose (default): loaded when the page opens, released when it closes.

@ProviderFor(wpConfigFiles)
final wpConfigFilesProvider = WpConfigFilesProvider._();

/// autoDispose (default): loaded when the page opens, released when it closes.

final class WpConfigFilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<IList<WpConfigFile>>,
          IList<WpConfigFile>,
          FutureOr<IList<WpConfigFile>>
        >
    with
        $FutureModifier<IList<WpConfigFile>>,
        $FutureProvider<IList<WpConfigFile>> {
  /// autoDispose (default): loaded when the page opens, released when it closes.
  WpConfigFilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wpConfigFilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wpConfigFilesHash();

  @$internal
  @override
  $FutureProviderElement<IList<WpConfigFile>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IList<WpConfigFile>> create(Ref ref) {
    return wpConfigFiles(ref);
  }
}

String _$wpConfigFilesHash() => r'5cfb9930c86d7d78757bcee4d9f07dfce3e48f72';

@ProviderFor(WpConfigController)
final wpConfigControllerProvider = WpConfigControllerProvider._();

final class WpConfigControllerProvider
    extends $AsyncNotifierProvider<WpConfigController, void> {
  WpConfigControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wpConfigControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wpConfigControllerHash();

  @$internal
  @override
  WpConfigController create() => WpConfigController();
}

String _$wpConfigControllerHash() =>
    r'60581e2d268af51082d6c1825dfb81a91447d29a';

abstract class _$WpConfigController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
