import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';

/// Rate the audio of [node] really flows at: the graph rate of its group driver as measured by
/// the PipeWire profiler ([driverRates], driver id → rate). A driver is the key of its own group.
/// Null when the node is idle or the profiler has no data for its group: nothing is guessed.
int? groupRate(PwNode node, IMap<int, int> driverRates) => driverRates[node.driverId ?? node.id];

/// The node's adapter converts between its own rate (`Format.rate`) and [groupRate].
/// Nodes without an own rate (DSP, e.g. remap/loopback) or with `resample.disable` never do.
bool resamples(PwNode node, IMap<int, int> driverRates) {
  final rate = node.rate;
  final group = groupRate(node, driverRates);
  return !node.resampleDisabled && rate != null && group != null && rate != group;
}
