import 'package:flutter/material.dart';

/// Palette of the "console" look (toolbars, dialogs, snackbars), built on the patchbay colors:
/// same dark greys as the canvas and the node boxes, the audio green as accent.
abstract final class ConsoleColors {
  /// Code blocks, dialog backdrop.
  static const backdrop = Color(0xFF141517);

  /// Inputs and inner cards (= patchbay canvas).
  static const field = Color(0xFF1E1F22);

  /// Toolbars, dialog footers, unselected cards.
  static const panel = Color(0xFF26282B);

  /// Dialogs and snackbars (= node body).
  static const surface = Color(0xFF2B2D30);

  static const divider = Color(0xFF3A3D42);
  static const outline = Color(0xFF4A4D53);
  static const text = Color(0xFFE6E6E6);
  static const muted = Color(0xFFA9ADB4);

  /// Primary buttons, switches on.
  static const accent = Color(0xFF2FBF2F);
  static const onAccent = Color(0xFF0B160B);

  /// LEDs, selected outlines.
  static const accentBright = Color(0xFF39D339);
  static const accentContainer = Color(0xFF1F3A1F);
  static const onAccentContainer = Color(0xFFCFF5CF);
  static const accentCard = Color(0xFF1E2A1E);

  /// Forced values (clock).
  static const warning = Color(0xFFFFD54F);
  static const warningContainer = Color(0xFF3A3320);
  static const warningSegment = Color(0xFF4A3F1E);

  static const danger = Color(0xFFC53030);
  static const dangerSoft = Color(0xFFFF8A80);
  static const dangerContainer = Color(0xFF3A2224);
  static const dangerOutline = Color(0xFF4A3434);

  static const link = Color(0xFF4FC3F7);

  /// Selected segment of a segmented control.
  static const segment = Color(0xFF3A3D42);

  /// Command preview: keys and values.
  static const codeKey = Color(0xFF4FC3F7);
  static const codeValue = Color(0xFFFFD54F);
}
