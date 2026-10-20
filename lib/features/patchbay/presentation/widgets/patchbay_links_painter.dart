import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_layout.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_link.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

/// Link being dragged from [port] (canvas point and media type of the port it started from) to
/// the [pointer]. [direction] is the direction of that port: the curve always goes output → input.
typedef LinkDraft = ({PortAnchor port, PortDirection direction, Offset pointer});

/// Horizontal bezier from an output port to an input port: shape of every PipeWire link.
Path linkCurve(Offset from, Offset to) {
  final handle = math.max(60.0, (to.dx - from.dx).abs() / 2);
  return Path()
    ..moveTo(from.dx, from.dy)
    ..cubicTo(from.dx + handle, from.dy, to.dx - handle, to.dy, to.dx, to.dy);
}

/// Vertical bezier from the bottom edge of a node to the top edge of the node stacked below it:
/// shape of the internal links. The handle stays shorter than the gap between stacked boxes, so
/// the dashes run straight down.
Path internalLinkCurve(Offset from, Offset to) {
  final handle = math.max(20.0, (to.dy - from.dy).abs() / 2);
  return Path()
    ..moveTo(from.dx, from.dy)
    ..cubicTo(from.dx, from.dy + handle, to.dx, to.dy - handle, to.dx, to.dy);
}

/// Link whose curve passes closest to [point], within [tolerance] (canvas units); null if none.
int? linkAt(IList<PwLink> links, Map<int, PortAnchor> anchors, Offset point, double tolerance) {
  int? closest;
  var best = tolerance;
  for (final link in links) {
    if ((anchors[link.outputPortId], anchors[link.inputPortId]) case (final PortAnchor from, final PortAnchor to)) {
      final curve = linkCurve(from.offset, to.offset);
      if (curve.getBounds().inflate(tolerance).contains(point)) {
        final distance = _distance(curve, point);
        if (distance <= best) {
          best = distance;
          closest = link.id;
        }
      }
    }
  }
  return closest;
}

/// Spacing of the points sampled along a curve to measure a distance from it.
const _sampleStep = 2.0;

/// Distance from [point] to [curve], sampled every [_sampleStep] along it.
double _distance(Path curve, Offset point) {
  var min = double.infinity;
  for (final metric in curve.computeMetrics()) {
    for (var offset = 0.0; offset <= metric.length; offset += _sampleStep) {
      if (metric.getTangentForOffset(offset)?.position case final Offset position) {
        min = math.min(min, (position - point).distance);
      }
    }
  }
  return min;
}

/// Links coloured by media type; links not yet active are drawn faded, the selected one lighter
/// and thicker, on top. Internal links (same `node.link-group`) are dashed grey lines from the
/// bottom of the receiving box down to the top of the producing one.
class PatchbayLinksPainter extends CustomPainter {
  PatchbayLinksPainter({required this.links, required this.anchors, required this.internalLinks, required this.selectedLinkId});

  final IList<PwLink> links;
  final Map<int, PortAnchor> anchors;
  final IList<InternalAnchor> internalLinks;
  final int? selectedLinkId;

  static const _width = 1.6;
  static const _selectedWidth = 3.2;
  static const _dash = 6.0;
  static const _gap = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _width
      ..isAntiAlias = true;

    PwLink? selected;
    for (final link in links) {
      if (link.id == selectedLinkId) {
        selected = link;
      } else if ((anchors[link.outputPortId], anchors[link.inputPortId]) case (final PortAnchor from, final PortAnchor to)) {
        final color = PatchbayColors.link(from.type);
        paint.color = link.active ? color : color.withValues(alpha: 0.35);
        canvas.drawPath(linkCurve(from.offset, to.offset), paint);
      }
    }

    paint.color = PatchbayColors.internalLink;
    for (final link in internalLinks) {
      _drawDashed(canvas, internalLinkCurve(link.from, link.to), paint);
    }

    if ((anchors[selected?.outputPortId], anchors[selected?.inputPortId]) case (final PortAnchor from, final PortAnchor to)) {
      paint
        ..color = PatchbayColors.selectedLink(from.type)
        ..strokeWidth = _selectedWidth;
      canvas.drawPath(linkCurve(from.offset, to.offset), paint);
    }
  }

  static void _drawDashed(Canvas canvas, Path path, Paint paint) {
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(metric.extractPath(distance, distance + _dash), paint);
        distance += _dash + _gap;
      }
    }
  }

  /// Repaint only if links, selection or a position changed (records compare by value).
  @override
  bool shouldRepaint(PatchbayLinksPainter oldDelegate) =>
      oldDelegate.links != links ||
      oldDelegate.selectedLinkId != selectedLinkId ||
      oldDelegate.internalLinks != internalLinks ||
      oldDelegate.anchors.length != anchors.length ||
      anchors.entries.any((e) => oldDelegate.anchors[e.key] != e.value);
}

/// The link being dragged, from its port to the pointer. Repaints on its own when [draft]
/// changes, without rebuilding the canvas.
class PatchbayDraftLinkPainter extends CustomPainter {
  PatchbayDraftLinkPainter(this.draft) : super(repaint: draft);

  final ValueListenable<LinkDraft?> draft;

  static const _width = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (draft.value case final LinkDraft current) {
      final (from, to) = current.direction == PortDirection.output
          ? (current.port.offset, current.pointer)
          : (current.pointer, current.port.offset);
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _width
        ..isAntiAlias = true
        ..color = PatchbayColors.link(current.port.type);
      canvas.drawPath(linkCurve(from, to), paint);
    }
  }

  @override
  bool shouldRepaint(PatchbayDraftLinkPainter oldDelegate) => oldDelegate.draft != draft;
}
