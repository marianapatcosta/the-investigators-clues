import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/widgets/game_setup_table.dart';
import 'package:my_botc_notes/widgets/player_item.dart';

class GameSessionArea extends StatefulWidget {
  const GameSessionArea({
    super.key,
    required this.gameSession,
    required this.saveGameSession,
  });

  final GameSession gameSession;
  final void Function() saveGameSession;

  @override
  State<GameSessionArea> createState() {
    return _GameSessionAreaState();
  }
}

class _GameSessionAreaState extends State<GameSessionArea> {
  void _onRemovePlayer(Player player) {
    setState(() {
      widget.gameSession.players.remove(player);
    });
    widget.saveGameSession();
  }

  double _dp(double radians, double radiusX, double radiusY) {
    return sqrt(
        pow(radiusX * sin(radians), 2) + pow(radiusY * cos(radians), 2));
  }

  List<Player> _getPlayers(BoxConstraints constraints) {
    final players = [...widget.gameSession.players];
    print(players.length);
    inspect(players);

    final radiusX = (constraints.maxWidth - kCharacterTokenSmallSize) / 2;
    final radiusY = (constraints.maxHeight - kCharacterTokenSmallSize) / 2;
    final coordinates = [];
    var precision = 0.001;
    var offset = pi * 0.5;
    var circ = 0.0;
    for (var radians = 0 + offset;
        radians < (pi * 2 + offset);
        radians += precision) {
      circ += _dp(radians, radiusX, radiusY);
    }
    var nextPoint = 0;
    var run = 0.0;
    for (var radians = 0 + offset;
        radians < (pi * 2 + offset);
        radians += precision) {
      if ((players.length * run / circ) >= nextPoint) {
        nextPoint++;
        var pointX = radiusX + (cos(radians) * radiusX);
        var pointY = radiusY + (sin(radians) * radiusY);
        coordinates.add([pointX, pointY]);
      }
      run += _dp(radians, radiusX, radiusY);
    }

    for (int index = 0; index < widget.gameSession.players.length; index++) {
      final [x, y] = coordinates[index];
      players[index].setX = x;
      players[index].setY = y;
    }

    return players;
  }

  @override
  Widget build(BuildContext context) {
    final GameSession(
      :players,
      :gameSetup,
      :numberOfPlayers,
      :numberOfAlivePlayers,
      :numberOfGhostVotes,
      :numberOfVotesRequiredToExecute,
      :fabled
    ) = widget.gameSession;

    return SliverFillViewport(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (BuildContext context, int index) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 100,
                    child: GameSetupTable(
                      gameSetup: gameSetup,
                      numberOfPlayers: numberOfPlayers,
                      numberOfAlivePlayers: numberOfAlivePlayers,
                      numberOfGhostVotes: numberOfGhostVotes,
                      numberOfVotesRequiredToExecute:
                          numberOfVotesRequiredToExecute,
                      fabled: fabled,
                    ),
                  ),
                ),
                for (final player in _getPlayers(constraints))
                  PlayerItem(
                    player: player,
                    scriptCharacters: widget.gameSession.script.characters,
                    removePlayer: () {
                      _onRemovePlayer(player);
                    },
                    updateParent: () {
                      setState(() {});
                    },
                    saveGameSession: widget.saveGameSession,
                    constraints: constraints,
                  )
              ]);
            },
          );
        },
      ),
    );
  }
}
