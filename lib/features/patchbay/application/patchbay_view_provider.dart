import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/patchbay/domain/models/patchbay_view.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/driver_rates_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/graph_snapshot.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_rates.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patchbay_view_provider.g.dart';

/// Nodes that have ports, with their ports split by direction, rates (own / group / requested,
/// resampling), plus links.
/// Own rate = negotiated `Format.rate` (pw-dump); group rate = rate measured by the PipeWire
/// profiler for the node's driver (pw-top). Notifies only when the resulting view changes:
/// a volume change still produces an equal view.
@riverpod
PatchbayView patchbayView(Ref ref) {
  final graph = ref.watch(pipewireGraphProvider.select((s) => s.value)) ?? const GraphSnapshot();
  final driverRates = ref.watch(driverRatesProvider.select((s) => s.value)) ?? const IMapConst<int, int>({});

  final portsByNode = <int, List<PwPort>>{};
  for (final port in graph.ports) {
    portsByNode.putIfAbsent(port.nodeId, () => []).add(port);
  }
  final visible = graph.nodes.where((n) => portsByNode.containsKey(n.id)).toList();

  // Identity across restarts (PipeWire ids change): `media.class|node.name`; nodes sharing both
  // (e.g. two streams of the same app) get `#2`, `#3`... in graph order.
  final occurrences = <String, int>{};
  final nodes = <PatchbayNode>[];
  for (final node in visible) {
    final base = '${node.mediaClass}|${node.name}';
    final occurrence = (occurrences[base] ?? 0) + 1;
    occurrences[base] = occurrence;
    nodes.add(
      PatchbayNode(
        id: node.id,
        key: occurrence > 1 ? '$base#$occurrence' : base,
        title: node.description,
        type: node.type,
        rate: node.rate,
        requestedRate: int.tryParse(node.module?.arguments['rate'] ?? ''),
        graphRate: groupRate(node, driverRates),
        resampling: resamples(node, driverRates),
        hasVolume: node.hasVolume,
        isDefault: node.name == graph.defaultSinkName || node.name == graph.defaultSourceName,
        owner: node.owner,
        inputs: _sorted(portsByNode[node.id] ?? const [], PortDirection.input),
        outputs: _sorted(portsByNode[node.id] ?? const [], PortDirection.output),
      ),
    );
  }

  return PatchbayView(
    nodes: nodes.lock,
    links: graph.links,
    internalLinks: _internalLinks(visible),
  );
}

IList<PwPort> _sorted(List<PwPort> ports, PortDirection direction) =>
    ports.where((p) => p.direction == direction).toIList().sort((a, b) => a.index.compareTo(b.index));

/// Within each `node.link-group`: receiving side → producing side.
/// remap-source: input.MyCapture (Stream/Input) → MyCapture.
IList<InternalLink> _internalLinks(Iterable<PwNode> nodes) {
  final groups = <String, List<PwNode>>{};
  for (final node in nodes) {
    if (node.linkGroup case final String group) {
      groups.putIfAbsent(group, () => []).add(node);
    }
  }
  return [
    for (final members in groups.values)
      for (final from in members.where((n) => _receives(n.type)))
        for (final to in members.where((n) => !_receives(n.type))) (from: from.id, to: to.id),
  ].lock;
}

/// Receiving side of a loopback: a capture stream or a sink.
bool _receives(PwNodeType type) => switch (type) {
  PwNodeType.audioSink || PwNodeType.audioStreamInput => true,
  _ => false,
};
