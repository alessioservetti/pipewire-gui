// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_clock_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Write side of the graph clock: `settings` metadata through pw-metadata, applied live by
/// PipeWire (no service restarted). State = outcome of the last command.

@ProviderFor(GraphClockController)
final graphClockControllerProvider = GraphClockControllerProvider._();

/// Write side of the graph clock: `settings` metadata through pw-metadata, applied live by
/// PipeWire (no service restarted). State = outcome of the last command.
final class GraphClockControllerProvider
    extends $AsyncNotifierProvider<GraphClockController, void> {
  /// Write side of the graph clock: `settings` metadata through pw-metadata, applied live by
  /// PipeWire (no service restarted). State = outcome of the last command.
  GraphClockControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphClockControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphClockControllerHash();

  @$internal
  @override
  GraphClockController create() => GraphClockController();
}

String _$graphClockControllerHash() =>
    r'c2756517f487c92abebb0ee9cc38cbf3262e59ef';

/// Write side of the graph clock: `settings` metadata through pw-metadata, applied live by
/// PipeWire (no service restarted). State = outcome of the last command.

abstract class _$GraphClockController extends $AsyncNotifier<void> {
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
