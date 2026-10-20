// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Write side of the mixer. State = outcome of the last command
/// (loading / error), listened by the page to show errors.

@ProviderFor(MixerController)
final mixerControllerProvider = MixerControllerProvider._();

/// Write side of the mixer. State = outcome of the last command
/// (loading / error), listened by the page to show errors.
final class MixerControllerProvider
    extends $AsyncNotifierProvider<MixerController, void> {
  /// Write side of the mixer. State = outcome of the last command
  /// (loading / error), listened by the page to show errors.
  MixerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mixerControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mixerControllerHash();

  @$internal
  @override
  MixerController create() => MixerController();
}

String _$mixerControllerHash() => r'00c3d390a363f819c63ef0ec4e9d297d9cccfbad';

/// Write side of the mixer. State = outcome of the last command
/// (loading / error), listened by the page to show errors.

abstract class _$MixerController extends $AsyncNotifier<void> {
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
