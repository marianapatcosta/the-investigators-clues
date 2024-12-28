import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:my_botc_notes/models/settings.dart';

const kSettings = 'settings';

class SettingsNotifier extends Notifier<Settings> {
  @override
  Settings build() {
    fetchSettings();
    return const Settings(
      themeMode: ThemeMode.light,
      locale: Locale('en'), //Locale(Intl.getCurrentLocale().split('_')[0]),
    );
  }

  Future<void> fetchSettings() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final settingsString = preferences.getString(kSettings);

    if (settingsString != null) {
      final settings = jsonDecode(settingsString);
      state = state.copyWith(
        themeMode: ThemeMode.values.byName(settings['themeMode']),
        locale: Locale(
          settings['locale'],
        ),
      );
    }
  }

  void saveState(SharedPreferences preferences) async {
    await preferences.setString(
      kSettings,
      jsonEncode(
        {
          'locale': state.locale.toString(),
          'themeMode': state.themeMode.name,
        },
      ),
    );
  }

  void setTheme(ThemeMode theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(themeMode: theme);
    saveState(preferences);
  }

  void setLocale(Locale locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(locale: locale);
    saveState(preferences);
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, Settings>(SettingsNotifier.new);
