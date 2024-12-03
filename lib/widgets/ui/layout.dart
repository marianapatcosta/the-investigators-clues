import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: kBreakpoints[ScreenSize.xl]!),
          padding: const EdgeInsets.only(bottom: 16),
          child: child,
        ),
      ),
    );
  }
}
