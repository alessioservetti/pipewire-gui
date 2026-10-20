import 'package:pipewire_gui/features/pipewire_graph/application/graph_commands.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/pipewire_repository.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/virtual_node_spec.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patchbay_controller.g.dart';

@Riverpod(keepAlive: true)
class PatchbayController extends _$PatchbayController {
  @override
  FutureOr<void> build() {}

  Future<void> link(int outputPortId, int inputPortId) =>
      _execute((repository) => repository.link(outputPortId, inputPortId));

  Future<void> unlink(int linkId) =>
      _execute((repository) => repository.unlink(linkId));

  /// [volume] in wpctl scale, 1.0 = 100%.
  Future<void> setVolume(int nodeId, double volume) =>
      _execute((repository) => repository.setVolume(nodeId, volume));

  Future<void> toggleMute(int nodeId) =>
      _execute((repository) => repository.toggleMute(nodeId));

  /// Default sink or default source, depending on the node.
  Future<void> setDefault(int nodeId) =>
      _execute((repository) => repository.setDefault(nodeId));

  Future<void> createNode(VirtualNodeSpec spec) =>
      _execute((repository) => repository.createVirtualNode(spec));

  /// Removes every node kept alive by [owner].
  Future<void> removeNodes(NodeOwner owner) =>
      _execute((repository) => repository.removeNodes(owner));

  Future<void> _execute(
    Future<void> Function(PipewireRepository repository) command,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => runGraphCommand(ref, command));
  }
}
