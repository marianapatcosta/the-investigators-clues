import 'package:flutter/material.dart';

class Settings {
  const Settings({
    required this.themeMode,
    required this.locale,
    this.showPlayersNotes = false,
    this.showVotingPhase = false,
    this.showGamePhase = true,
    this.showGameSetup = true,
    this.playerTokenScale = 1,
    this.reminderTokenScale = 1,
  });

  final ThemeMode themeMode;
  final Locale locale;
  final bool showPlayersNotes;
  final bool showVotingPhase;
  final bool showGamePhase;
  final bool showGameSetup;
  final double playerTokenScale;
  final double reminderTokenScale;

  Settings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool? showPlayersNotes,
    bool? showVotingPhase,
    bool? showGamePhase,
    bool? showGameSetup,
    double? playerTokenScale,
    double? reminderTokenScale,
  }) =>
      Settings(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
        showPlayersNotes: showPlayersNotes ?? this.showPlayersNotes,
        showVotingPhase: showVotingPhase ?? this.showVotingPhase,
        showGamePhase: showGamePhase ?? this.showGamePhase,
        showGameSetup: showGameSetup ?? this.showGameSetup,
        playerTokenScale: playerTokenScale ?? this.playerTokenScale,
        reminderTokenScale: reminderTokenScale ?? this.reminderTokenScale,
      );
}
