import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  const ButtonTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  final String label;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double borderWidth = isSelected ? 3.0 : 1.0;
    Color color =
        isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface;

    return Transform.translate(
      offset: Offset(0, isSelected ? 0 : 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: borderWidth,
              color: color,
            ),
          ),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.bottomCenter,
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: theme.textTheme.titleSmall!.copyWith(
                color: color,
                fontSize: 20,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
