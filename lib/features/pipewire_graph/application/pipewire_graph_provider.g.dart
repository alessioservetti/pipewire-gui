// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipewire_graph_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Single source of truth for the PipeWire state.
///
/// Polling: every build schedules `ref.invalidateSelf` after [_pollInterval],
/// so the provider rebuilds itself forever.
/// - during a reload AsyncValue keeps the previous value (no flicker);
/// - on error the last valid snapshot is kept, Riverpod retries;
/// - an identical snapshot (`==`) notifies nobody.

@ProviderFor(PipewireGraph)
final pipewireGraphProvider = PipewireGraphProvider._();

/// Single source of truth for the PipeWire state.
///
/// Polling: every build schedules `ref.invalidateSelf` after [_pollInterval],
/// so the provider rebuilds itself forever.
/// - during a reload AsyncValue keeps the previous value (no flicker);
/// - on error the last valid snapshot is kept, Riverpod retries;
/// - an identical snapshot (`==`) notifies nobody.
final class PipewireGraphProvider
    extends $AsyncNotifierProvider<PipewireGraph, GraphSnapshot> {
  /// Single source of truth for the PipeWire state.
  ///
  /// Polling: every build schedules `ref.invalidateSelf` after [_pollInterval],
  /// so the provider rebuilds itself forever.
  /// - during a reload AsyncValue keeps the previous value (no flicker);
  /// - on error the last valid snapshot is kept, Riverpod retries;
  /// - an identical snapshot (`==`) notifies nobody.
  PipewireGraphProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pipewireGraphProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pipewireGraphHash();

  @$internal
  @override
  PipewireGraph create() => PipewireGraph();
}

String _$pipewireGraphHash() => r'eb7b11a3ef0a33c4422400e94266247f13c90c56';

/// Single source of truth for the PipeWire state.
///
/// Polling: every build schedules `ref.invalidateSelf` after [_pollInterval],
/// so the provider rebuilds itself forever.
/// - during a reload AsyncValue keeps the previous value (no flicker);
/// - on error the last valid snapshot is kept, Riverpod retries;
/// - an identical snapshot (`==`) notifies nobody.

abstract class _$PipewireGraph extends $AsyncNotifier<GraphSnapshot> {
  FutureOr<GraphSnapshot> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<GraphSnapshot>, GraphSnapshot>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GraphSnapshot>, GraphSnapshot>,
              AsyncValue<GraphSnapshot>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
