import 'package:flutter/material.dart';

/// Dropdown with an outlined label, fully controlled: shows [value], reports [onChanged].
/// [T] may be nullable: null is then a regular choice (e.g. "Automatic").
/// [value] must be one of the [items] values.
class LabeledDropdown<T> extends StatelessWidget {
  const LabeledDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.helper,
  });

  final String label;
  final T value;

  /// Value and text of every choice.
  final List<(T, String)> items;
  final ValueChanged<T> onChanged;

  /// Hint under the field.
  final String? helper;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label, helperText: helper, helperMaxLines: 3, border: const OutlineInputBorder()),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isDense: true,
          isExpanded: true,
          items: [
            for (final (item, text) in items) DropdownMenuItem<T>(value: item, child: Text(text, overflow: TextOverflow.ellipsis)),
          ],
          onChanged: (selected) {
            if (selected is T) {
              onChanged(selected);
            }
          },
        ),
      ),
    );
  }
}
