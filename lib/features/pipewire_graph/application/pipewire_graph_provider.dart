import 'dart:async';

import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/graph_snapshot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pipewire_graph_provider.g.dart';

const _pollInterval = Duration(seconds: 1);

/// Single source of truth for the PipeWire state.
///
/// Polling: every build schedules `ref.invalidateSelf` after [_pollInterval],
/// so the provider rebuilds itself forever.
/// - during a reload AsyncValue keeps the previous value (no flicker);
/// - on error the last valid snapshot is kept, Riverpod retries;
/// - an identical snapshot (`==`) notifies nobody.
@Riverpod(keepAlive: true)
class PipewireGraph extends _$PipewireGraph {
  @override
  Future<GraphSnapshot> build() {
    final repository = ref.watch(pipewireRepositoryProvider);

    final timer = Timer(_pollInterval, ref.invalidateSelf);
    ref.onDispose(timer.cancel);

    return repository.fetchGraph();
  }
}
