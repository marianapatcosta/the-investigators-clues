import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final safeAreaInsets = MediaQuery.of(context).padding;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: safeAreaInsets.top,
          child: Container(color: theme.appBarTheme.backgroundColor),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
