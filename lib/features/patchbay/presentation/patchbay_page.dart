import 'dart:io' show FileSystemException;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';
import 'package:pipewire_gui/core/widgets/console_widgets.dart';
import 'package:pipewire_gui/features/graph_clock/presentation/graph_clock_button.dart';
import 'package:pipewire_gui/features/patchbay/application/node_positions_providers.dart';
import 'package:pipewire_gui/features/patchbay/application/patchbay_controller.dart';
import 'package:pipewire_gui/features/patchbay/application/patchbay_view_provider.dart';
import 'package:pipewire_gui/features/patchbay/domain/models/patchbay_view.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/create_node_dialog.dart';
import 'package:pipewire_gui/features/patchbay/presentation/widgets/patchbay_canvas.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/pipewire_graph_provider.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/virtual_node_spec.dart';
import 'package:pipewire_gui/features/pipewire_graph/presentation/graph_gate.dart';

class PatchbayPage extends ConsumerWidget {
  const PatchbayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(patchbayControllerProvider, (previous, next) {
      if (next case AsyncError(:final error)) {
        showConsoleError(context, error);
      }
    });

    final view = ref.watch(patchbayViewProvider);
    final saved = ref.watch(savedNodePositionsProvider);

    // The saved positions are needed before the first nodes are placed. Unreadable: start
    // without them.
    if (saved case AsyncLoading()) {
      return const Center(child: CircularProgressIndicator());
    }
    return GraphGate(
      child: PatchbayCanvas(
        view: view,
        savedPositions: saved.value ?? const IMapConst<String, Offset>({}),
        onPositionsChanged: (positions) => _savePositions(context, ref, positions),
        onLink: (outputPortId, inputPortId) => ref.read(patchbayControllerProvider.notifier).link(outputPortId, inputPortId),
        onUnlink: (linkId) => ref.read(patchbayControllerProvider.notifier).unlink(linkId),
        onDeleteNode: (node) => _deleteNode(context, ref, node),
        toolbar: ConsolePanel(
          children: [
            ConsoleButton(
              label: 'New node',
              icon: Icons.add,
              kind: ConsoleButtonKind.primary,
              onPressed: () => _createNode(context, ref),
            ),
            const ConsolePanelDivider(),
            const GraphClockButton(),
          ],
        ),
      ),
    );
  }

  Future<void> _savePositions(BuildContext context, WidgetRef ref, Map<String, Offset> positions) async {
    try {
      await ref.read(nodePositionsStoreProvider).save(positions);
    } on FileSystemException catch (error) {
      if (context.mounted) {
        showConsoleError(context, error);
      }
    }
  }

  /// Opens the modal with the current sinks / sources as targets, then loads the module.
  Future<void> _createNode(BuildContext context, WidgetRef ref) async {
    final nodes = ref.read(pipewireGraphProvider).value?.nodes ?? const IListConst<PwNode>([]);
    final sinks = _options(nodes, PwNodeType.audioSink);
    final monitors = [for (final sink in sinks) (name: '${sink.name}.monitor', label: 'Monitor of ${sink.label}')];

    final spec = await showDialog<VirtualNodeSpec>(
      context: context,
      builder: (context) => CreateNodeDialog(
        sinks: sinks,
        sources: [..._options(nodes, PwNodeType.audioSource), ...monitors],
        takenNames: {for (final node in nodes) node.name},
      ),
    );
    if (spec != null && context.mounted) {
      await ref.read(patchbayControllerProvider.notifier).createNode(spec);
    }
  }

  /// Nodes with an owner (pactl module, pw-loopback process): asks for confirmation, listing
  /// every node that goes away with it, then removes the owner. Devices and apps cannot be
  /// removed from here.
  Future<void> _deleteNode(BuildContext context, WidgetRef ref, PatchbayNode node) async {
    if (node.owner case final owner?) {
      final removed = [
        for (final other in ref.read(patchbayViewProvider).nodes)
          if (other.owner == owner) other.title,
      ];
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => ConsoleDialog(
          compact: true,
          icon: Icons.delete_outline,
          accent: ConsoleColors.dangerSoft,
          accentBackground: ConsoleColors.dangerContainer,
          title: 'Remove ${node.title}?',
          actions: [
            ConsoleButton(label: 'Cancel', onPressed: () => Navigator.of(context).pop(false)),
            ConsoleButton(label: 'Remove', kind: ConsoleButtonKind.danger, onPressed: () => Navigator.of(context).pop(true)),
          ],
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                const Text('These nodes go away with it', style: consoleHintStyle),
                Wrap(spacing: 6, runSpacing: 6, children: [for (final title in removed) _NodeChip(title)]),
              ],
            ),
            ConsoleCodeBlock(text: _removalCommand(owner)),
          ],
        ),
      );
      if (confirmed == true && context.mounted) {
        await ref.read(patchbayControllerProvider.notifier).removeNodes(owner);
      }
    } else {
      showConsoleInfo(context, '${node.title} was not created by a pactl module or pw-loopback: it cannot be removed here');
    }
  }

  /// What removing [owner] runs, for the confirmation.
  String _removalCommand(NodeOwner owner) => switch (owner) {
    ModuleOwner(:final module) => 'pactl unload-module ${module.index}  # ${module.name}',
    LoopbackProcessOwner(:final clientId, :final processId) =>
      'pw-cli destroy $clientId  # pw-loopback, PID ${processId ?? '?'} exits',
  };

  /// One option per `node.name` (a dropdown needs unique values).
  List<NodeOption> _options(IList<PwNode> nodes, PwNodeType type) => {
    for (final node in nodes)
      if (node.type == type) node.name: (name: node.name, label: node.description),
  }.values.toList();
}

/// Name of a node going away, in the removal confirmation.
class _NodeChip extends StatelessWidget {
  const _NodeChip(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.field,
        border: Border.all(color: ConsoleColors.divider),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(title, style: const TextStyle(fontSize: 12, color: ConsoleColors.text)),
      ),
    );
  }
}
