// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patchbay_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Nodes that have ports, with their ports split by direction, rates (own / group / requested,
/// resampling), plus links.
/// Own rate = negotiated `Format.rate` (pw-dump); group rate = rate measured by the PipeWire
/// profiler for the node's driver (pw-top). Notifies only when the resulting view changes:
/// a volume change still produces an equal view.

@ProviderFor(patchbayView)
final patchbayViewProvider = PatchbayViewProvider._();

/// Nodes that have ports, with their ports split by direction, rates (own / group / requested,
/// resampling), plus links.
/// Own rate = negotiated `Format.rate` (pw-dump); group rate = rate measured by the PipeWire
/// profiler for the node's driver (pw-top). Notifies only when the resulting view changes:
/// a volume change still produces an equal view.

final class PatchbayViewProvider
    extends $FunctionalProvider<PatchbayView, PatchbayView, PatchbayView>
    with $Provider<PatchbayView> {
  /// Nodes that have ports, with their ports split by direction, rates (own / group / requested,
  /// resampling), plus links.
  /// Own rate = negotiated `Format.rate` (pw-dump); group rate = rate measured by the PipeWire
  /// profiler for the node's driver (pw-top). Notifies only when the resulting view changes:
  /// a volume change still produces an equal view.
  PatchbayViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patchbayViewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patchbayViewHash();

  @$internal
  @override
  $ProviderElement<PatchbayView> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PatchbayView create(Ref ref) {
    return patchbayView(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatchbayView value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatchbayView>(value),
    );
  }
}

String _$patchbayViewHash() => r'10f8549172e86fba1d6ab58bf80b0c8021d447db';
