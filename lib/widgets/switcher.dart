import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  const Switcher({
    super.key,
    required this.title,
    required this.value,
    this.onChange,
  });

  final String title;
  final bool value;
  final void Function(bool isChecked)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          width: 32,
        ),
        Switch(
          value: value,
          onChanged: onChange,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
