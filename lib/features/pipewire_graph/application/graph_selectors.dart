import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_device.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_link.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graph_selectors.g.dart';

// Derived, read-only views of pipewireGraphProvider.
// Each one notifies only when its own result changes (==).

/// Nodes with a given `media.class` (see MediaClass).
@riverpod
IList<PwNode> nodesByClass(Ref ref, String mediaClass) {
  final nodes = ref.watch(
    pipewireGraphProvider.select(
      (s) => s.value?.nodes ?? const IListConst<PwNode>([]),
    ),
  );
  return nodes.where((n) => n.mediaClass == mediaClass).toIList();
}

/// Ids only: a list rebuilds when nodes appear/disappear, not on volume changes.
@riverpod
IList<int> nodeIdsByClass(Ref ref, String mediaClass) =>
    ref.watch(nodesByClassProvider(mediaClass)).map((n) => n.id).toIList();

/// One node: each tile rebuilds only when its own node changes.
@riverpod
PwNode? pwNode(Ref ref, int id) =>
    ref.watch(pipewireGraphProvider.select((s) => s.value?.nodeById(id)));

@riverpod
PwNode? defaultSink(Ref ref) =>
    ref.watch(pipewireGraphProvider.select((s) => s.value?.defaultSink));

@riverpod
PwNode? defaultSource(Ref ref) =>
    ref.watch(pipewireGraphProvider.select((s) => s.value?.defaultSource));

/// Graph sample rate (`clock.rate` of the `settings` metadata).
@riverpod
int? clockRate(Ref ref) =>
    ref.watch(pipewireGraphProvider.select((s) => s.value?.clock.rate));

@riverpod
IList<PwDevice> graphDevices(Ref ref) => ref.watch(
      pipewireGraphProvider.select(
        (s) => s.value?.devices ?? const IListConst<PwDevice>([]),
      ),
    );

@riverpod
IList<PwPort> graphPorts(Ref ref) => ref.watch(
      pipewireGraphProvider.select(
        (s) => s.value?.ports ?? const IListConst<PwPort>([]),
      ),
    );

@riverpod
IList<PwLink> graphLinks(Ref ref) => ref.watch(
      pipewireGraphProvider.select(
        (s) => s.value?.links ?? const IListConst<PwLink>([]),
      ),
    );
