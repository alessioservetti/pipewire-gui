// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipewire_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pipewireRepository)
final pipewireRepositoryProvider = PipewireRepositoryProvider._();

final class PipewireRepositoryProvider
    extends
        $FunctionalProvider<
          PipewireRepository,
          PipewireRepository,
          PipewireRepository
        >
    with $Provider<PipewireRepository> {
  PipewireRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pipewireRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pipewireRepositoryHash();

  @$internal
  @override
  $ProviderElement<PipewireRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PipewireRepository create(Ref ref) {
    return pipewireRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PipewireRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PipewireRepository>(value),
    );
  }
}

String _$pipewireRepositoryHash() =>
    r'697f6df04e51ac407d381966625b7e4bceed4570';
