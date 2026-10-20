// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireplumber_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wireplumberConfigService)
final wireplumberConfigServiceProvider = WireplumberConfigServiceProvider._();

final class WireplumberConfigServiceProvider
    extends
        $FunctionalProvider<
          WireplumberConfigService,
          WireplumberConfigService,
          WireplumberConfigService
        >
    with $Provider<WireplumberConfigService> {
  WireplumberConfigServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wireplumberConfigServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wireplumberConfigServiceHash();

  @$internal
  @override
  $ProviderElement<WireplumberConfigService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WireplumberConfigService create(Ref ref) {
    return wireplumberConfigService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WireplumberConfigService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WireplumberConfigService>(value),
    );
  }
}

String _$wireplumberConfigServiceHash() =>
    r'5db708916d1d5525f8748d008f953e7270cf27f4';
