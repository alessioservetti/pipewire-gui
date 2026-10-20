import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:pipewire_gui/features/patchbay/domain/models/patchbay_view.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

typedef PortAnchor = ({Offset offset, PortMediaType type});

typedef InternalAnchor = ({Offset from, Offset to});

/// Measured by the node box after layout: its size and the point of each port on its edge,
/// relative to the box top-left corner.
typedef NodeGeometry = ({Size size, IMap<int, Offset> anchors});

/// Layered auto-layout, left → right following the links, using the measured node [sizes].
/// Nodes joined by internal links (same `node.link-group`) form a stack: one column, one box
/// below the other, receiving side on top ([_stacks]). Every stack is laid out as a unit:
/// - linked stacks: column = longest chain of links before them (app → virtual sink → DAC);
/// - unlinked stacks: outputs only → first column, inputs only → last, both → second.
/// Within a column, linked stacks first, then stacked top-down.
Map<int, Offset> autoLayout(PatchbayView view, Map<int, Size> sizes) {
  final stacks = _stacks(view);
  final stackOf = <int, int>{
    for (final (index, stack) in stacks.indexed)
      for (final node in stack) node.id: index,
  };
  final edges = <(int, int)>{
    for (final link in view.links)
      if ((stackOf[link.outputNodeId], stackOf[link.inputNodeId]) case (final int from, final int to) when from != to) (from, to),
  };
  final linked = <int>{
    for (final (from, to) in edges) ...{from, to},
  };

  // Longest path; bounded passes so a cycle cannot loop forever.
  final depth = List.filled(stacks.length, 0);
  for (var pass = 0; pass < stacks.length; pass++) {
    for (final (from, to) in edges) {
      depth[to] = math.max(depth[to], depth[from] + 1);
    }
  }
  final maxDepth = depth.fold<int>(0, (a, b) => math.max(a, b));

  int column(int stack) {
    if (linked.contains(stack)) {
      return depth[stack];
    }
    if (stacks[stack].every((n) => n.inputs.isEmpty)) {
      return 0;
    }
    if (stacks[stack].every((n) => n.outputs.isEmpty)) {
      return math.max(maxDepth, 2);
    }
    return 1;
  }

  // Column x = sum of the widest node of each previous column + gaps.
  final columnWidths = <int, double>{};
  for (final (index, stack) in stacks.indexed) {
    final col = column(index);
    for (final node in stack) {
      columnWidths[col] = math.max(columnWidths[col] ?? 0.0, sizes[node.id]?.width ?? 0.0);
    }
  }
  final lastColumn = columnWidths.keys.fold<int>(0, (a, b) => math.max(a, b));
  final columnX = <int, double>{};
  var x = PatchbayMetrics.canvasPadding;
  for (var col = 0; col <= lastColumn; col++) {
    columnX[col] = x;
    x += (columnWidths[col] ?? 0.0) + PatchbayMetrics.columnGap;
  }

  final indices = List.generate(stacks.length, (index) => index);
  final ordered = [...indices.where(linked.contains), ...indices.where((index) => !linked.contains(index))];

  final positions = <int, Offset>{};
  final nextY = <int, double>{};
  for (final index in ordered) {
    final col = column(index);
    var y = nextY[col] ?? PatchbayMetrics.canvasPadding;
    for (final node in stacks[index]) {
      positions[node.id] = Offset(columnX[col] ?? PatchbayMetrics.canvasPadding, y);
      y += (sizes[node.id]?.height ?? 0.0) + PatchbayMetrics.nodeGap;
    }
    nextY[col] = y;
  }
  return positions;
}

/// Nodes grouped by internal links, top-down: receiving side (the `from` of the internal links)
/// first, then the producing side. A node without internal links is a stack of its own.
/// Stacks follow the order of [PatchbayView.nodes].
List<List<PatchbayNode>> _stacks(PatchbayView view) {
  final group = <int, int>{for (final node in view.nodes) node.id: node.id};
  for (final link in view.internalLinks) {
    final from = group[link.from];
    final to = group[link.to];
    if (from != null && to != null) {
      group.updateAll((id, current) => current == to ? from : current);
    }
  }
  final receivers = {for (final link in view.internalLinks) link.from};
  final members = <int, List<PatchbayNode>>{};
  for (final node in view.nodes) {
    members.putIfAbsent(group[node.id] ?? node.id, () => []).add(node);
  }
  return [
    for (final stack in members.values)
      [...stack.where((n) => receivers.contains(n.id)), ...stack.where((n) => !receivers.contains(n.id))],
  ];
}

/// Positions for the nodes of [view] not yet in [placed]; nodes already placed never move.
/// - nothing placed yet (patchbay just opened): full [autoLayout];
/// - otherwise each new node goes below the lowest node already overlapping its column: the
///   column of the node above it in its stack ([_stacks]), or the one [autoLayout] would give it.
Map<int, Offset> placeNewNodes(PatchbayView view, Map<int, Offset> placed, Map<int, Size> sizes) {
  final auto = autoLayout(view, sizes);
  if (placed.isEmpty) {
    return auto;
  }
  final added = <int, Offset>{};
  for (final stack in _stacks(view)) {
    Offset? above;
    for (final node in stack) {
      if (placed[node.id] case final Offset position) {
        above = position;
      } else {
        final x = above?.dx ?? auto[node.id]?.dx ?? PatchbayMetrics.canvasPadding;
        final width = sizes[node.id]?.width ?? 0.0;
        final position = Offset(x, _columnBottom(view, {...placed, ...added}, sizes, x, width));
        added[node.id] = position;
        above = position;
      }
    }
  }
  return added;
}

/// First free y below the placed nodes that horizontally overlap [x]..[x]+[width].
double _columnBottom(PatchbayView view, Map<int, Offset> placed, Map<int, Size> sizes, double x, double width) {
  var bottom = PatchbayMetrics.canvasPadding;
  for (final node in view.nodes) {
    final position = placed[node.id];
    final size = sizes[node.id];
    if (position != null && size != null && position.dx < x + width && x < position.dx + size.width) {
      bottom = math.max(bottom, position.dy + size.height + PatchbayMetrics.nodeGap);
    }
  }
  return bottom;
}

/// Canvas point of every port, keyed by port id: node position + measured port anchor.
Map<int, PortAnchor> portAnchors(PatchbayView view, Map<int, Offset> positions, Map<int, NodeGeometry> geometry) {
  final anchors = <int, PortAnchor>{};
  for (final node in view.nodes) {
    final position = positions[node.id];
    final relative = geometry[node.id]?.anchors;
    if (position != null && relative != null) {
      for (final port in [...node.inputs, ...node.outputs]) {
        final offset = relative[port.id];
        if (offset != null) {
          anchors[port.id] = (offset: position + offset, type: port.mediaType);
        }
      }
    }
  }
  return anchors;
}

/// Internal links: bottom edge of the receiving node → top edge of the producing node stacked
/// below it, both at the middle of the edge.
IList<InternalAnchor> internalAnchors(PatchbayView view, Map<int, Offset> positions, Map<int, NodeGeometry> geometry) => [
  for (final link in view.internalLinks)
    if ((positions[link.from], geometry[link.from]?.size, positions[link.to], geometry[link.to]?.size)
        case (final Offset from, final Size fromSize, final Offset to, final Size toSize))
      (from: from + Offset(fromSize.width / 2, fromSize.height), to: to + Offset(toSize.width / 2, 0)),
].lock;
