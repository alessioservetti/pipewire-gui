import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_device.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_link.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

part 'graph_snapshot.freezed.dart';

/// Whole PipeWire graph at one point in time (one `pw-dump`).
/// Value equality (freezed + IList): two identical polls are `==`,
/// so Riverpod does not notify anyone.
@freezed
abstract class GraphSnapshot with _$GraphSnapshot {
  const GraphSnapshot._();

  const factory GraphSnapshot({
    @Default(IListConst<PwNode>([])) IList<PwNode> nodes,
    @Default(IListConst<PwDevice>([])) IList<PwDevice> devices,
    @Default(IListConst<PwPort>([])) IList<PwPort> ports,
    @Default(IListConst<PwLink>([])) IList<PwLink> links,

    /// `default.audio.sink` from the `default` metadata (node name).
    String? defaultSinkName,

    /// `default.audio.source` from the `default` metadata (node name).
    String? defaultSourceName,

    /// Clock entries of the `settings` metadata (rate, allowed / forced rate, quantum).
    @Default(ClockSettings()) ClockSettings clock,
  }) = _GraphSnapshot;

  PwNode? get defaultSink => _nodeByName(defaultSinkName);

  PwNode? get defaultSource => _nodeByName(defaultSourceName);

  PwNode? nodeById(int id) {
    for (final node in nodes) {
      if (node.id == id) {
        return node;
      }
    }
    return null;
  }

  PwNode? _nodeByName(String? name) {
    for (final node in nodes) {
      if (node.name == name) {
        return node;
      }
    }
    return null;
  }
}
