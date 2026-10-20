// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patchbay_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PatchbayController)
final patchbayControllerProvider = PatchbayControllerProvider._();

final class PatchbayControllerProvider
    extends $AsyncNotifierProvider<PatchbayController, void> {
  PatchbayControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patchbayControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patchbayControllerHash();

  @$internal
  @override
  PatchbayController create() => PatchbayController();
}

String _$patchbayControllerHash() =>
    r'2641834272f64c20bc6061ea930a289241307e44';

abstract class _$PatchbayController extends $AsyncNotifier<void> {
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
