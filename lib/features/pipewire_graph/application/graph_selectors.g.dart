// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Nodes with a given `media.class` (see MediaClass).

@ProviderFor(nodesByClass)
final nodesByClassProvider = NodesByClassFamily._();

/// Nodes with a given `media.class` (see MediaClass).

final class NodesByClassProvider
    extends $FunctionalProvider<IList<PwNode>, IList<PwNode>, IList<PwNode>>
    with $Provider<IList<PwNode>> {
  /// Nodes with a given `media.class` (see MediaClass).
  NodesByClassProvider._({
    required NodesByClassFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'nodesByClassProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodesByClassHash();

  @override
  String toString() {
    return r'nodesByClassProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IList<PwNode>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IList<PwNode> create(Ref ref) {
    final argument = this.argument as String;
    return nodesByClass(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<PwNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<PwNode>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodesByClassProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodesByClassHash() => r'4d90337f00f4e69db37a7b2ad7ba437a01b2e55d';

/// Nodes with a given `media.class` (see MediaClass).

final class NodesByClassFamily extends $Family
    with $FunctionalFamilyOverride<IList<PwNode>, String> {
  NodesByClassFamily._()
    : super(
        retry: null,
        name: r'nodesByClassProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Nodes with a given `media.class` (see MediaClass).

  NodesByClassProvider call(String mediaClass) =>
      NodesByClassProvider._(argument: mediaClass, from: this);

  @override
  String toString() => r'nodesByClassProvider';
}

/// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.

@ProviderFor(nodeIdsByClass)
final nodeIdsByClassProvider = NodeIdsByClassFamily._();

/// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.

final class NodeIdsByClassProvider
    extends $FunctionalProvider<IList<int>, IList<int>, IList<int>>
    with $Provider<IList<int>> {
  /// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.
  NodeIdsByClassProvider._({
    required NodeIdsByClassFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'nodeIdsByClassProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeIdsByClassHash();

  @override
  String toString() {
    return r'nodeIdsByClassProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IList<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IList<int> create(Ref ref) {
    final argument = this.argument as String;
    return nodeIdsByClass(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeIdsByClassProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodeIdsByClassHash() => r'a98766ea71fef759e45a7943c287c0918601b890';

/// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.

final class NodeIdsByClassFamily extends $Family
    with $FunctionalFamilyOverride<IList<int>, String> {
  NodeIdsByClassFamily._()
    : super(
        retry: null,
        name: r'nodeIdsByClassProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.

  NodeIdsByClassProvider call(String mediaClass) =>
      NodeIdsByClassProvider._(argument: mediaClass, from: this);

  @override
  String toString() => r'nodeIdsByClassProvider';
}

/// One node: each tile rebuilds only when its own node changes.

@ProviderFor(pwNode)
final pwNodeProvider = PwNodeFamily._();

/// One node: each tile rebuilds only when its own node changes.

final class PwNodeProvider
    extends $FunctionalProvider<PwNode?, PwNode?, PwNode?>
    with $Provider<PwNode?> {
  /// One node: each tile rebuilds only when its own node changes.
  PwNodeProvider._({
    required PwNodeFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pwNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pwNodeHash();

  @override
  String toString() {
    return r'pwNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<PwNode?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PwNode? create(Ref ref) {
    final argument = this.argument as int;
    return pwNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PwNode? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PwNode?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PwNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pwNodeHash() => r'a832c7f73fcd688cda422035ea8481c0ad2af8f5';

/// One node: each tile rebuilds only when its own node changes.

final class PwNodeFamily extends $Family
    with $FunctionalFamilyOverride<PwNode?, int> {
  PwNodeFamily._()
    : super(
        retry: null,
        name: r'pwNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One node: each tile rebuilds only when its own node changes.

  PwNodeProvider call(int id) => PwNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'pwNodeProvider';
}

@ProviderFor(defaultSink)
final defaultSinkProvider = DefaultSinkProvider._();

final class DefaultSinkProvider
    extends $FunctionalProvider<PwNode?, PwNode?, PwNode?>
    with $Provider<PwNode?> {
  DefaultSinkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultSinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultSinkHash();

  @$internal
  @override
  $ProviderElement<PwNode?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PwNode? create(Ref ref) {
    return defaultSink(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PwNode? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PwNode?>(value),
    );
  }
}

String _$defaultSinkHash() => r'8e78d61392f1cce6de70425d0e434b5a6ff24f34';

@ProviderFor(defaultSource)
final defaultSourceProvider = DefaultSourceProvider._();

final class DefaultSourceProvider
    extends $FunctionalProvider<PwNode?, PwNode?, PwNode?>
    with $Provider<PwNode?> {
  DefaultSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultSourceHash();

  @$internal
  @override
  $ProviderElement<PwNode?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PwNode? create(Ref ref) {
    return defaultSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PwNode? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PwNode?>(value),
    );
  }
}

String _$defaultSourceHash() => r'3716e64b321dc0cdb201ca939d21bfe79e355615';

/// Graph sample rate (`clock.rate` of the `settings` metadata).

@ProviderFor(clockRate)
final clockRateProvider = ClockRateProvider._();

/// Graph sample rate (`clock.rate` of the `settings` metadata).

final class ClockRateProvider extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
  /// Graph sample rate (`clock.rate` of the `settings` metadata).
  ClockRateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockRateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockRateHash();

  @$internal
  @override
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    return clockRate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$clockRateHash() => r'8d4ad5156f58b965f8bc80fd65661f3429c5d444';

@ProviderFor(graphDevices)
final graphDevicesProvider = GraphDevicesProvider._();

final class GraphDevicesProvider
    extends
        $FunctionalProvider<IList<PwDevice>, IList<PwDevice>, IList<PwDevice>>
    with $Provider<IList<PwDevice>> {
  GraphDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphDevicesHash();

  @$internal
  @override
  $ProviderElement<IList<PwDevice>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IList<PwDevice> create(Ref ref) {
    return graphDevices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<PwDevice> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<PwDevice>>(value),
    );
  }
}

String _$graphDevicesHash() => r'8335ed64d7bea0d58aa2d8a5ecb43f4d6d84f18c';

@ProviderFor(graphPorts)
final graphPortsProvider = GraphPortsProvider._();

final class GraphPortsProvider
    extends $FunctionalProvider<IList<PwPort>, IList<PwPort>, IList<PwPort>>
    with $Provider<IList<PwPort>> {
  GraphPortsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphPortsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphPortsHash();

  @$internal
  @override
  $ProviderElement<IList<PwPort>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IList<PwPort> create(Ref ref) {
    return graphPorts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<PwPort> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<PwPort>>(value),
    );
  }
}

String _$graphPortsHash() => r'ceae8195e490d49a5ed770036f4b49b29f738ba0';

@ProviderFor(graphLinks)
final graphLinksProvider = GraphLinksProvider._();

final class GraphLinksProvider
    extends $FunctionalProvider<IList<PwLink>, IList<PwLink>, IList<PwLink>>
    with $Provider<IList<PwLink>> {
  GraphLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphLinksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphLinksHash();

  @$internal
  @override
  $ProviderElement<IList<PwLink>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IList<PwLink> create(Ref ref) {
    return graphLinks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IList<PwLink> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IList<PwLink>>(value),
    );
  }
}

String _$graphLinksHash() => r'fcd2344f55a21bc155f9e3de13f5bb85336d68ba';
