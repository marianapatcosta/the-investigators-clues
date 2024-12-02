import 'package:flutter/material.dart';

class ScreenMetadata {
  const ScreenMetadata({
    required this.titleKey,
    this.icon,
    this.image,
    required this.screen,
  });

  final String titleKey;
  final IconData? icon;
  final AssetImage? image;
  final Widget screen;
}
