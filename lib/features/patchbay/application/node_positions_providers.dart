import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/features/patchbay/data/node_positions_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'node_positions_providers.g.dart';

@Riverpod(keepAlive: true)
NodePositionsStore nodePositionsStore(Ref ref) => NodePositionsStore.user();

/// Node positions saved by the previous session, read once at startup.
@Riverpod(keepAlive: true)
Future<IMap<String, Offset>> savedNodePositions(Ref ref) => ref.watch(nodePositionsStoreProvider).load();
