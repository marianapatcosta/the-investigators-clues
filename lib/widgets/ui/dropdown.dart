import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/index.dart' show DropdownItem;

double kDropdownMinWidth = 150;

class Dropdown<T extends Object> extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onSelect,
  });

  final String title;
  final T value;
  final List<DropdownItem<T>> items;
  final ValueChanged<T?>? onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        DropdownMenu(
          width: kDropdownMinWidth,
          initialSelection: value,
          enableSearch: false,
          trailingIcon: Icon(
            Icons.keyboard_arrow_down,
            color: theme.colorScheme.primary,
          ),
          selectedTrailingIcon: Icon(
            Icons.keyboard_arrow_up,
            color: theme.colorScheme.primary,
          ),
          dropdownMenuEntries:
              items.map<DropdownMenuEntry<T>>((DropdownItem<T> menu) {
            return DropdownMenuEntry<T>(
              value: menu.value,
              label: menu.label,
            );
          }).toList(),
          onSelected: onSelect,
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            constraints: BoxConstraints.tight(const Size.fromHeight(40)),
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
        ),
      ],
    );
  }
}
