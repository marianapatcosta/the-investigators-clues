import 'dart:math';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/script.dart';

class GameSession {
  GameSession({
    required this.gameSetup,
    required this.script,
    required this.players,
  });

  final GameSetup gameSetup;
  final Script script;
  final List<Player> players;

  String? _notes;
  String? _infoToken;
  Character? _fabled;

  String? get notes {
    return _notes;
  }

  String? get infoToken {
    return _infoToken;
  }

  Character? get fabled {
    return _fabled;
  }

  int get numberOfPlayers {
    return players.length;
  }

  int get numberOfGhostVotes {
    return players
        .where((player) => player.isDead && player.hasGhostVote)
        .length;
  }

  int get numberOfAlivePlayers {
    return players.where((player) => !player.isDead).length;
  }

  int get numberOfVotesRequiredToExecute {
    return (numberOfAlivePlayers / 2).ceil();
  }

  set setNotes(String notes) {
    _notes = notes;
  }

  set setInfoToken(String infoToken) {
    _infoToken = infoToken;
  }

  set setFabled(Character fabled) {
    _fabled = fabled;
  }

  GameSession.fromJson(Map<String, dynamic> json)
      : gameSetup = GameSetup.fromJson(json['gameSetup']),
        players = List.from(json['players'])
            .map((item) => Player.fromJson(item))
            .toList(),
        script = Script.fromJson(json['script']),
        _notes = json['notes'] as String?,
        _infoToken = json['infoToken'] as String?,
        _fabled =
            json['fabled'] == null ? null : Character.fromJson(json['fabled']);

  Map<String, dynamic> toJson() {
    return {
      'gameSetup': gameSetup.toJson(),
      'players': players.map((player) => player.toJson()).toList(),
      'script': script.toJson(),
      'notes': notes,
      'fabled': fabled,
      'infoToken': infoToken,
    };
  }
}
