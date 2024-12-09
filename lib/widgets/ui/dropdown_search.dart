import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/index.dart' show DropdownItem;

class DropdownSearch<T extends Object> extends StatelessWidget {
  const DropdownSearch({
    super.key,
    required this.title,
    required this.items,
    required this.onSelect,
    this.initialValue,
    this.hintText,
    this.width,
    this.menuHeight,
  });

  final String title;
  final List<DropdownItem<T>> items;
  final ValueChanged<T?>? onSelect;
  final T? initialValue;
  final String? hintText;
  final double? width;
  final double? menuHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownMenu(
            width: width,
            menuHeight: menuHeight,
            initialSelection: initialValue,
            hintText: hintText,
            requestFocusOnTap: false,
            enableSearch: false,
            enableFilter: false,
            trailingIcon: Icon(
              Icons.keyboard_arrow_down,
              color: theme.colorScheme.primary,
            ),
            selectedTrailingIcon: Icon(
              Icons.keyboard_arrow_up,
              color: theme.colorScheme.primary,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints.tight(const Size.fromHeight(50)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            dropdownMenuEntries:
                items.map<DropdownMenuEntry<T>>((DropdownItem<T> menu) {
              return DropdownMenuEntry<T>(
                value: menu.value,
                label: menu.label,
              );
            }).toList(),
            onSelected: (value) {
              FocusScope.of(context).unfocus();
              onSelect!(value);
            }),
      ],
    );
  }
}
