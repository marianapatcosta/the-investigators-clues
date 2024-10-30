import 'package:flutter/material.dart';

class ScreenMetadata {
  const ScreenMetadata({
    required this.titleKey,
    required this.icon,
    required this.screen,
  });

  final String titleKey;
  final IconData icon;
  final Widget screen;
}
