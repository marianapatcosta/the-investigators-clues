import 'package:flutter/material.dart';
import 'package:my_botc_notes/widgets/linear_gradient_mask.dart';

class GameSetupTableItem extends StatelessWidget {
  const GameSetupTableItem({
    super.key,
    required this.text,
    this.icon,
    this.image,
    this.gradientColors,
  });

  final String text;
  final Icon? icon;
  final ImageIcon? image;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(
          width: 4,
        ),
        if (gradientColors != null && icon != null)
          LinearGradientMask(
            colors: gradientColors!,
            child: icon!,
          )
        else
          icon ?? image!
      ],
    );
  }
}
