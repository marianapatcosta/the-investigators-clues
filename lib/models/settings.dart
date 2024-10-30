import 'package:flutter/material.dart';

class Settings {
  const Settings({
    required this.themeMode,
    required this.locale,
  });

  final ThemeMode themeMode;
  final Locale locale;

  Settings copyWith({ThemeMode? themeMode, Locale? locale}) => Settings(
      themeMode: themeMode ?? this.themeMode, locale: locale ?? this.locale);
}
