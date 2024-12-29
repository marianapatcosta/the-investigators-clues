import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:my_botc_notes/models/settings.dart';
import 'theme_color_fallback.dart'
    if (dart.library.html) 'theme_color_web.dart';

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
        showPlayersNotes: settings['showPlayersNotes'],
        showVotingPhase: settings['showVotingPhase'],
        showGamePhase: settings['showGamePhase'],
        showGameSetup: settings['showGameSetup'],
        playerTokenScale: settings['playerTokenScale'],
        reminderTokenScale: settings['reminderTokenScale'],
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
          'showPlayersNotes': state.showPlayersNotes,
          'showVotingPhase': state.showVotingPhase,
          'showGamePhase': state.showGamePhase,
          'showGameSetup': state.showGameSetup,
          'playerTokenScale': state.playerTokenScale,
          'reminderTokenScale': state.reminderTokenScale,
        },
      ),
    );
  }

  void setTheme(ThemeMode theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(themeMode: theme);
    saveState(preferences);

    if (kIsWeb) {
      final color = theme == ThemeMode.dark ? '#231e23' : '#2c0b3f';

      // change title bar theme color for PWA
      updateThemeColor(color);
    }
  }

  void setLocale(Locale locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(locale: locale);
    saveState(preferences);
  }

  void toggleShowPlayersNotes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final updatedShowVotingPhase =
        !state.showPlayersNotes ? false : state.showVotingPhase;

    state = state.copyWith(
        showPlayersNotes: !state.showPlayersNotes,
        showVotingPhase: updatedShowVotingPhase);
    saveState(preferences);
  }

  void toggleShowVotingPhase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final updatedShowPlayersNotes =
        !state.showVotingPhase ? false : state.showPlayersNotes;
    state = state.copyWith(
        showVotingPhase: !state.showVotingPhase,
        showPlayersNotes: updatedShowPlayersNotes);
    saveState(preferences);
  }

  void toggleShowGamePhase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(showGamePhase: !state.showGamePhase);
    saveState(preferences);
  }

  void toggleShowGameSetup() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(showGameSetup: !state.showGameSetup);
    saveState(preferences);
  }

  void setPlayerTokenScale(double scale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(playerTokenScale: scale);
    saveState(preferences);
  }

  void setReminderTokenScale(double scale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    state = state.copyWith(reminderTokenScale: scale);
    saveState(preferences);
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, Settings>(SettingsNotifier.new);
