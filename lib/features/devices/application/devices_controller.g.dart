// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DevicesController)
final devicesControllerProvider = DevicesControllerProvider._();

final class DevicesControllerProvider
    extends $AsyncNotifierProvider<DevicesController, void> {
  DevicesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicesControllerHash();

  @$internal
  @override
  DevicesController create() => DevicesController();
}

String _$devicesControllerHash() => r'c6db2a815956c5b184e8087d5b0f174b4eac91e7';

abstract class _$DevicesController extends $AsyncNotifier<void> {
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
