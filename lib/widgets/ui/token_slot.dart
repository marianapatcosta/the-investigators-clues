import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';

class TokenSlot extends StatelessWidget {
  const TokenSlot({
    super.key,
    this.size = kCharacterTokenSizeLarge,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [
          theme.colorScheme.surfaceContainer,
          theme.colorScheme.surface,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface,
            spreadRadius: -1.0,
            blurRadius: 3.0,
          ),
        ],
      ),
    );
  }
}
