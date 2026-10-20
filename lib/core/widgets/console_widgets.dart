import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pipewire_gui/core/process/command_exception.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';

/// Building blocks of the "console" look: floating panels, buttons, dialogs, form controls,
/// snackbars. Every color comes from [ConsoleColors]; sizes come from content and padding.

/// Monospace (system font) with tabular figures: rates, node names, commands.
TextStyle consoleMono({double size = 13, FontWeight weight = FontWeight.w500, Color color = ConsoleColors.text}) => TextStyle(
  fontFamily: 'monospace',
  fontSize: size,
  fontWeight: weight,
  color: color,
  fontFeatures: const [FontFeature.tabularFigures()],
);

const consoleHintStyle = TextStyle(fontSize: 12, color: ConsoleColors.muted, height: 1.4);

/// 48000 → `48 000`.
String groupedDigits(int value) => '$value'.replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ' ');

/// Floating pill holding toolbar controls.
class ConsolePanel extends StatelessWidget {
  const ConsolePanel({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.panel,
        border: Border.all(color: ConsoleColors.divider),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x73000000), blurRadius: 30, offset: Offset(0, 10))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: IntrinsicHeight(
          child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, spacing: 6, children: children),
        ),
      ),
    );
  }
}

/// Vertical separator inside a [ConsolePanel].
class ConsolePanelDivider extends StatelessWidget {
  const ConsolePanelDivider({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalDivider(width: 9, thickness: 1, indent: 8, endIndent: 8, color: ConsoleColors.divider);
}

enum ConsoleButtonKind { primary, secondary, danger }

class ConsoleButton extends StatelessWidget {
  const ConsoleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.kind = ConsoleButtonKind.secondary,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ConsoleButtonKind kind;

  @override
  Widget build(BuildContext context) {
    final (background, foreground, side) = switch (kind) {
      ConsoleButtonKind.primary => (ConsoleColors.accent, ConsoleColors.onAccent, BorderSide.none),
      ConsoleButtonKind.danger => (ConsoleColors.danger, Colors.white, BorderSide.none),
      ConsoleButtonKind.secondary => (Colors.transparent, ConsoleColors.text, const BorderSide(color: ConsoleColors.outline)),
    };
    final style = TextButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      side: side,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: TextStyle(fontSize: 13, fontWeight: kind == ConsoleButtonKind.secondary ? FontWeight.w500 : FontWeight.w600),
    );
    if (icon case final IconData data) {
      return TextButton.icon(style: style, onPressed: onPressed, icon: Icon(data, size: 18), label: Text(label));
    }
    return TextButton(style: style, onPressed: onPressed, child: Text(label));
  }
}

/// Square icon button, 44 px touch target.
class ConsoleIconButton extends StatelessWidget {
  const ConsoleIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.color = ConsoleColors.text,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      color: color,
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(13),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

/// Status dot: green and glowing when on.
class ConsoleLed extends StatelessWidget {
  const ConsoleLed({super.key, required this.on});

  final bool on;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: on ? ConsoleColors.accentBright : ConsoleColors.outline,
        boxShadow: on ? const [BoxShadow(color: ConsoleColors.accentBright, blurRadius: 10)] : null,
      ),
    );
  }
}

/// Small caps section label, optional [trailing] on the right (e.g. the metadata key).
class ConsoleSectionLabel extends StatelessWidget {
  const ConsoleSectionLabel(this.text, {super.key, this.trailing});

  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.9, color: ConsoleColors.muted),
          ),
        ),
        if (trailing case final Widget widget) widget,
      ],
    );
  }
}

/// [ConsoleSectionLabel] above [child], [hint] below.
class ConsoleField extends StatelessWidget {
  const ConsoleField({super.key, required this.label, required this.child, this.trailing, this.hint});

  final String label;
  final Widget child;
  final Widget? trailing;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        ConsoleSectionLabel(label, trailing: trailing),
        child,
        if (hint case final String text) Text(text, style: consoleHintStyle),
      ],
    );
  }
}

/// Segmented control, one equal segment per item. [T] may be nullable (null = e.g. "Automatic").
/// [mono]: labels that are values (starting with a digit) in monospace, words stay in the UI font.
/// A label wider than its segment shrinks instead of being cut.
/// [selectedColor] / [selectedBackground] tint the selected segment (amber for forced values).
class ConsoleSegmented<T> extends StatelessWidget {
  const ConsoleSegmented({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.mono = false,
    this.selectedColor = Colors.white,
    this.selectedBackground = ConsoleColors.segment,
  });

  final T value;
  final List<(T, String)> items;
  final ValueChanged<T>? onChanged;
  final bool mono;
  final Color selectedColor;
  final Color selectedBackground;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.field,
        border: Border.all(color: ConsoleColors.outline),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          spacing: 2,
          children: [
            for (final (item, label) in items)
              Expanded(child: _segment(item, label, selected: item == value)),
          ],
        ),
      ),
    );
  }

  Widget _segment(T item, String label, {required bool selected}) {
    final onChanged = this.onChanged;
    final style = mono && label.startsWith(RegExp(r'\d'))
        ? consoleMono(size: 12, weight: selected ? FontWeight.w600 : FontWeight.w500, color: selected ? selectedColor : ConsoleColors.muted)
        : TextStyle(fontSize: 12, fontWeight: selected ? FontWeight.w600 : FontWeight.w500, color: selected ? selectedColor : ConsoleColors.muted);
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? selectedBackground : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: onChanged != null ? () => onChanged(item) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
            child: Center(
              child: FittedBox(fit: BoxFit.scaleDown, child: Text(label, maxLines: 1, softWrap: false, style: style)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Toggle chip: green with a check when selected.
class ConsoleToggleChip extends StatelessWidget {
  const ConsoleToggleChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.mono = false,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final bool mono;

  @override
  Widget build(BuildContext context) {
    final color = selected ? ConsoleColors.onAccentContainer : ConsoleColors.text;
    final weight = selected ? FontWeight.w600 : FontWeight.w500;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: selected ? ConsoleColors.accentBright : ConsoleColors.outline),
    );
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? ConsoleColors.accentContainer : Colors.transparent,
        shape: shape,
        child: InkWell(
          customBorder: shape,
          onTap: () => onSelected(!selected),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                if (selected) Icon(Icons.check, size: 14, color: color),
                Text(label, style: mono ? consoleMono(size: 12, weight: weight, color: color) : TextStyle(fontSize: 12, fontWeight: weight, color: color)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Compact switch; disabled (dimmed) when [onChanged] is null.
class ConsoleSwitch extends StatelessWidget {
  const ConsoleSwitch({super.key, required this.value, required this.onChanged, required this.label});

  final bool value;
  final ValueChanged<bool>? onChanged;

  /// For screen readers.
  final String label;

  @override
  Widget build(BuildContext context) {
    final onChanged = this.onChanged;
    return Semantics(
      label: label,
      toggled: value,
      enabled: onChanged != null,
      child: Opacity(
        opacity: onChanged != null ? 1 : 0.4,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onChanged != null ? () => onChanged(!value) : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 36,
            height: 20,
            padding: const EdgeInsets.all(2),
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            decoration: BoxDecoration(
              color: value ? ConsoleColors.accent : ConsoleColors.outline,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(shape: BoxShape.circle, color: value ? Colors.white : const Color(0xFFC9CCD1)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Title + description on the left, [ConsoleSwitch] on the right, on a panel background.
class ConsoleSwitchRow extends StatelessWidget {
  const ConsoleSwitchRow({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
    this.monoTitle = false,
  });

  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool monoTitle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: ConsoleColors.panel, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(title, style: monoTitle ? consoleMono() : const TextStyle(fontSize: 13, color: ConsoleColors.text)),
                  Text(description, style: consoleHintStyle),
                ],
              ),
            ),
            ConsoleSwitch(value: value, onChanged: onChanged, label: title),
          ],
        ),
      ),
    );
  }
}

/// Dropdown field. [T] may be nullable (null = e.g. "Default sink"); [value] must be among the
/// [items]. [detail] adds a second, monospace line to an item (e.g. the `node.name`).
class ConsoleSelect<T> extends StatelessWidget {
  const ConsoleSelect({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.mono = false,
    this.detail,
  });

  final T value;
  final List<(T, String)> items;
  final ValueChanged<T> onChanged;
  final bool mono;
  final String? Function(T value)? detail;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.field,
        border: Border.all(color: ConsoleColors.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            itemHeight: null,
            dropdownColor: ConsoleColors.surface,
            borderRadius: BorderRadius.circular(8),
            icon: const Icon(Icons.keyboard_arrow_down, size: 18, color: ConsoleColors.muted),
            style: mono ? consoleMono() : const TextStyle(fontSize: 13, color: ConsoleColors.text),
            items: [
              for (final (item, text) in items) DropdownMenuItem<T>(value: item, child: _item(item, text)),
            ],
            onChanged: (selected) {
              if (selected is T) {
                onChanged(selected);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _item(T item, String text) {
    final label = Text(text, maxLines: 1, overflow: TextOverflow.ellipsis);
    if (detail?.call(item) case final String line) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: [
            label,
            Text(line, maxLines: 1, overflow: TextOverflow.ellipsis, style: consoleMono(size: 11, weight: FontWeight.w400, color: ConsoleColors.muted)),
          ],
        ),
      );
    }
    return label;
  }
}

class ConsoleTextField extends StatelessWidget {
  const ConsoleTextField({
    super.key,
    required this.controller,
    this.hint,
    this.mono = false,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hint;
  final bool mono;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      cursorColor: ConsoleColors.accentBright,
      style: mono ? consoleMono() : const TextStyle(fontSize: 13, color: ConsoleColors.text),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: (mono ? consoleMono(weight: FontWeight.w400) : const TextStyle(fontSize: 13)).copyWith(color: ConsoleColors.muted),
        filled: true,
        fillColor: ConsoleColors.field,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        enabledBorder: _border(ConsoleColors.outline),
        focusedBorder: _border(ConsoleColors.accentBright),
        errorBorder: _border(ConsoleColors.dangerSoft),
        focusedErrorBorder: _border(ConsoleColors.dangerSoft),
        errorStyle: const TextStyle(fontSize: 12, color: ConsoleColors.dangerSoft),
      ),
    );
  }

  static OutlineInputBorder _border(Color color) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: color));
}

/// Command block: monospace, selectable, copy button. [spans] colors it; [text] is what is copied.
class ConsoleCodeBlock extends StatelessWidget {
  const ConsoleCodeBlock({super.key, required this.text, this.spans});

  final String text;
  final List<InlineSpan>? spans;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.backdrop,
        border: Border.all(color: ConsoleColors.divider),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 4, 4, 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SelectableText.rich(
                  TextSpan(children: spans ?? [TextSpan(text: text)]),
                  style: consoleMono(size: 12, weight: FontWeight.w400).copyWith(height: 1.65),
                ),
              ),
            ),
            ConsoleIconButton(
              icon: Icons.copy_outlined,
              tooltip: 'Copy',
              color: ConsoleColors.muted,
              onPressed: () => Clipboard.setData(ClipboardData(text: text)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Dialog frame: icon tile, title, subtitle and close button; scrollable body; footer with an
/// optional note and the actions. [compact]: small confirmation (no subtitle, no close button,
/// actions under the body).
class ConsoleDialog extends StatelessWidget {
  const ConsoleDialog({
    super.key,
    required this.icon,
    required this.accent,
    required this.accentBackground,
    required this.title,
    required this.children,
    required this.actions,
    this.subtitle,
    this.footerNote,
    this.compact = false,
  });

  /// A dialog spanning a wide desktop window is unreadable: it grows up to these widths.
  static const _maxWidth = 712.0;
  static const _compactMaxWidth = 440.0;

  final IconData icon;
  final Color accent;
  final Color accentBackground;
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final List<Widget> actions;
  final String? footerNote;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ConsoleColors.surface,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(compact ? 14 : 16),
        side: const BorderSide(color: ConsoleColors.divider),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: compact ? _compactMaxWidth : _maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(context),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(compact ? 20 : 24, 0, compact ? 20 : 24, 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, spacing: compact ? 14 : 20, children: children),
              ),
            ),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: compact ? const EdgeInsets.fromLTRB(20, 20, 20, 14) : const EdgeInsets.fromLTRB(24, 22, 14, 18),
      child: Row(
        spacing: compact ? 12 : 14,
        children: [
          Container(
            padding: EdgeInsets.all(compact ? 10 : 11),
            decoration: BoxDecoration(color: accentBackground, borderRadius: BorderRadius.circular(compact ? 10 : 12)),
            child: Icon(icon, size: compact ? 20 : 22, color: accent),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: compact ? 17 : 20, fontWeight: FontWeight.w600, color: ConsoleColors.text),
                ),
                if (subtitle case final String text) Text(text, style: const TextStyle(fontSize: 13, color: ConsoleColors.muted)),
              ],
            ),
          ),
          if (!compact)
            ConsoleIconButton(icon: Icons.close, tooltip: 'Close', color: ConsoleColors.muted, onPressed: () => Navigator.of(context).pop()),
        ],
      ),
    );
  }

  Widget _footer() {
    final row = Row(
      spacing: 8,
      children: [
        if (footerNote case final String note) Expanded(child: Text(note, style: consoleHintStyle)) else const Spacer(),
        ...actions,
      ],
    );
    if (compact) {
      return Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 20), child: row);
    }
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: ConsoleColors.panel,
        border: Border(top: BorderSide(color: ConsoleColors.divider)),
      ),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14), child: row),
    );
  }
}

/// Short readable form of a command error: `pw-link: failed to link ports: File exists`.
String errorSummary(Object error) {
  if (error case CommandException(:final executable, :final stderr, :final exitCode)) {
    final reason = stderr.split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).firstOrNull;
    return '$executable: ${reason ?? 'exit $exitCode'}';
  }
  return '$error';
}

/// A snackbar can span a wide window: it grows up to this.
const _snackBarMaxWidth = 640.0;

/// Error snackbar: summary, "Details" opens the full error.
void showConsoleError(BuildContext context, Object error) {
  _showConsoleSnackBar(
    context,
    icon: Icons.error_outline,
    iconColor: ConsoleColors.dangerSoft,
    border: ConsoleColors.dangerOutline,
    message: errorSummary(error),
    action: SnackBarAction(
      label: 'Details',
      textColor: ConsoleColors.link,
      onPressed: () {
        if (context.mounted) {
          showDialog<void>(
            context: context,
            builder: (context) => ConsoleDialog(
              compact: true,
              icon: Icons.error_outline,
              accent: ConsoleColors.dangerSoft,
              accentBackground: ConsoleColors.dangerContainer,
              title: 'Command failed',
              actions: [ConsoleButton(label: 'Close', onPressed: () => Navigator.of(context).pop())],
              children: [ConsoleCodeBlock(text: '$error')],
            ),
          );
        }
      },
    ),
  );
}

/// Informative snackbar.
void showConsoleInfo(BuildContext context, String message) {
  _showConsoleSnackBar(
    context,
    icon: Icons.info_outline,
    iconColor: ConsoleColors.link,
    border: ConsoleColors.divider,
    message: message,
  );
}

void _showConsoleSnackBar(
  BuildContext context, {
  required IconData icon,
  required Color iconColor,
  required Color border,
  required String message,
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      width: math.min(MediaQuery.sizeOf(context).width - 32, _snackBarMaxWidth),
      backgroundColor: ConsoleColors.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: border)),
      showCloseIcon: true,
      closeIconColor: ConsoleColors.muted,
      action: action,
      content: Row(
        spacing: 12,
        children: [
          Icon(icon, size: 18, color: iconColor),
          Expanded(
            child: Text(message, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: ConsoleColors.text)),
          ),
        ],
      ),
    ),
  );
}
