class DropdownItem<T extends Object> {
  const DropdownItem({
    required this.label,
    required this.value,
  });

  final String label;
  final T value;
}
