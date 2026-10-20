// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_positions_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nodePositionsStore)
final nodePositionsStoreProvider = NodePositionsStoreProvider._();

final class NodePositionsStoreProvider
    extends
        $FunctionalProvider<
          NodePositionsStore,
          NodePositionsStore,
          NodePositionsStore
        >
    with $Provider<NodePositionsStore> {
  NodePositionsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodePositionsStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodePositionsStoreHash();

  @$internal
  @override
  $ProviderElement<NodePositionsStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodePositionsStore create(Ref ref) {
    return nodePositionsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodePositionsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodePositionsStore>(value),
    );
  }
}

String _$nodePositionsStoreHash() =>
    r'f3ec86adaac4cdd7c1ee00606b2d9d9fefc01586';

/// Node positions saved by the previous session, read once at startup.

@ProviderFor(savedNodePositions)
final savedNodePositionsProvider = SavedNodePositionsProvider._();

/// Node positions saved by the previous session, read once at startup.

final class SavedNodePositionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, Offset>>,
          IMap<String, Offset>,
          FutureOr<IMap<String, Offset>>
        >
    with
        $FutureModifier<IMap<String, Offset>>,
        $FutureProvider<IMap<String, Offset>> {
  /// Node positions saved by the previous session, read once at startup.
  SavedNodePositionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedNodePositionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedNodePositionsHash();

  @$internal
  @override
  $FutureProviderElement<IMap<String, Offset>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<String, Offset>> create(Ref ref) {
    return savedNodePositions(ref);
  }
}

String _$savedNodePositionsHash() =>
    r'74b9863fec8809e70fc51d6258da39b23be7c825';
