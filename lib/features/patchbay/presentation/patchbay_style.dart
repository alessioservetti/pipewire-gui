import 'package:flutter/material.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';

/// Layout spacing and box width. Heights are not here: boxes size themselves from their content
/// and the canvas works with the measured sizes.
abstract final class PatchbayMetrics {
  static const nodeWidth = 240.0;
  static const columnGap = 140.0;
  static const nodeGap = 24.0;
  static const canvasPadding = 40.0;
}

abstract final class PatchbayColors {
  static const canvas = Color(0xFF1E1F22);
  static const nodeBody = Color(0xFF2B2D30);
  static const nodeBorder = Color(0xFF55585E);
  static const nodeTitle = Color(0xFFE6E6E6);
  static const portText = Color(0xFFF0F0F0);
  static const internalLink = Color(0xFFB0B0B0);
  static const resampling = Color(0xFFFFB74D);

  /// Border of a port that would accept the link being dragged onto it.
  static const portHighlight = Color(0xFFFFFFFF);

  /// Volume bar: slider fill.
  static const volume = Color(0xFF4FC3F7);

  /// Volume bar while muted: icon, and slider fill (dimmed).
  static const muted = Color(0xFFE57373);
  static const mutedSlider = Color(0xFF6E7177);

  /// Default sink / default source: box border and star.
  static const defaultNode = Color(0xFFFFD54F);

  /// Glow around the selected node.
  static const nodeSelection = Color(0xCCFFFFFF);

  static Color portFill(PortMediaType type) => switch (type) {
    PortMediaType.audio => const Color(0xFF1F6B1F),
    PortMediaType.midi => const Color(0xFF7A1515),
    PortMediaType.video => const Color(0xFF1A3F7A),
    PortMediaType.other => const Color(0xFF4A4A4A),
  };

  static Color portBorder(PortMediaType type) => switch (type) {
    PortMediaType.audio => const Color(0xFF39D339),
    PortMediaType.midi => const Color(0xFFE04848),
    PortMediaType.video => const Color(0xFF4A90E2),
    PortMediaType.other => const Color(0xFF9E9E9E),
  };

  static Color link(PortMediaType type) => switch (type) {
    PortMediaType.audio => const Color(0xFF2FBF2F),
    PortMediaType.midi => const Color(0xFFD03A3A),
    PortMediaType.video => const Color(0xFF4A90E2),
    PortMediaType.other => const Color(0xFF9E9E9E),
  };

  /// Selected link: its media colour, lightened.
  static Color selectedLink(PortMediaType type) => Color.lerp(link(type), portHighlight, 0.6) ?? portHighlight;
}
