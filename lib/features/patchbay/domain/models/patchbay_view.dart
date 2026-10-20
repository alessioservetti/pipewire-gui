import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_link.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

part 'patchbay_view.freezed.dart';

/// Audio flowing inside a process between two nodes of the same
/// `node.link-group` (no PipeWire link): from the node receiving audio
/// to the node producing it.
typedef InternalLink = ({int from, int to});

/// A node box: inputs on the left, outputs on the right, sorted by `port.id`.
@freezed
abstract class PatchbayNode with _$PatchbayNode {
  const factory PatchbayNode({
    required int id,

    /// Identity across restarts, unlike [id]: `media.class|node.name` (`#2`, `#3`... for nodes
    /// sharing both). Key of the saved position.
    required String key,
    required String title,
    required PwNodeType type,

    /// Effective sample rate, null for DSP nodes that follow the graph clock.
    int? rate,

    /// `rate=` argument of the pactl module that created the node, if any.
    int? requestedRate,

    /// Rate the audio actually flows at in the node's group (its driver's rate).
    int? graphRate,

    /// The node resamples between [rate] and [graphRate].
    @Default(false) bool resampling,

    /// The node has a volume to show and set. The value itself is not here (see [PatchbayView]):
    /// the volume bar reads it on its own.
    @Default(false) bool hasVolume,

    /// Default sink or default source (`default` metadata).
    @Default(false) bool isDefault,

    /// What keeps the node alive (pactl module or pw-loopback process), null if the GUI cannot
    /// remove it. Removing it removes every node with the same owner.
    NodeOwner? owner,
    @Default(IListConst<PwPort>([])) IList<PwPort> inputs,
    @Default(IListConst<PwPort>([])) IList<PwPort> outputs,
  }) = _PatchbayNode;
}

/// What the patchbay draws. Contains no volume/mute: a volume change
/// produces an equal view, so the patchbay does not rebuild.
@freezed
abstract class PatchbayView with _$PatchbayView {
  const PatchbayView._();

  const factory PatchbayView({
    @Default(IListConst<PatchbayNode>([])) IList<PatchbayNode> nodes,
    @Default(IListConst<PwLink>([])) IList<PwLink> links,
    @Default(IListConst<InternalLink>([])) IList<InternalLink> internalLinks,
  }) = _PatchbayView;

  /// Output → input ports of the link that joining [a] and [b] would create, whichever of the two
  /// the drag started from. Null when they cannot be linked: same direction, different media
  /// type, or already linked.
  ({int output, int input})? newLink(PwPort a, PwPort b) {
    final (output, input) = a.direction == PortDirection.output ? (a, b) : (b, a);
    final linkable =
        output.direction == PortDirection.output &&
        input.direction == PortDirection.input &&
        output.mediaType == input.mediaType &&
        !links.any((link) => link.outputPortId == output.id && link.inputPortId == input.id);
    return linkable ? (output: output.id, input: input.id) : null;
  }
}
