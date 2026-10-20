import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_module.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';

part 'pw_node.freezed.dart';

@freezed
abstract class PwNode with _$PwNode {
  const factory PwNode({
    required int id,

    /// `node.name`: stable identifier, used by the `default` metadata.
    required String name,

    /// `node.description` / `node.nick`: label for the UI.
    required String description,

    /// `media.class`, see MediaClass.
    required String mediaClass,

    @Default(PwNodeType.other) PwNodeType type,

    /// `device.id`, null for streams and virtual nodes.
    int? deviceId,

    /// Volume in wpctl scale (cubic): 1.0 = 100%.
    @Default(1.0) double volume,
    @Default(false) bool mute,

    /// The node exposes a volume (`channelVolumes` in its device Route or its Props), so wpctl
    /// can read and set it; [volume] and [mute] are meaningful only when true.
    /// False e.g. for MIDI bridges and video nodes.
    @Default(false) bool hasVolume,

    /// Effective sample rate (`Format.rate`). Null for DSP nodes without a
    /// fixed rate (e.g. remap/loopback): they run at the graph clock.
    int? rate,

    /// Module that created the node, null if not created via pactl.
    PwModule? module,

    /// What keeps the node alive, when the GUI can remove it: its pactl [module], or the
    /// `pw-loopback` process that created it. Null for devices, apps, WirePlumber nodes.
    NodeOwner? owner,

    /// `node.link-group`: nodes with the same value are connected
    /// internally (e.g. the two halves of a loopback / remap-source).
    String? linkGroup,

    /// `node.driver-id`: driver of the group the node is running in.
    /// Null when the node is idle or is itself the driver.
    int? driverId,

    /// `resample.disable`: the node never resamples, it always runs at the graph rate.
    @Default(false) bool resampleDisabled,
  }) = _PwNode;
}
