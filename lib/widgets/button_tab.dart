import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/styles.dart';
import 'package:my_botc_notes/utils.dart';

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
    final width = MediaQuery.of(context).size.width;
    Color color = isSelected ? kDarkColorScheme.primary : Colors.white;

    return Transform.translate(
      offset: Offset(0, isScreenBiggerThanX(width, ScreenSize.md) ? 3 : 1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    width: 3,
                    color: kDarkColorScheme.primary,
                  ),
                )
              : null,
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
