import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/custom_info_token.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/bluffs.dart';
import 'package:my_botc_notes/widgets/edit_notes.dart';
import 'package:my_botc_notes/widgets/game_phase.dart';
import 'package:my_botc_notes/widgets/game_setup_table.dart';
import 'package:my_botc_notes/widgets/info_token_manager.dart';
import 'package:my_botc_notes/widgets/info_token_selector.dart';
import 'package:my_botc_notes/widgets/player_item.dart';
import 'package:my_botc_notes/widgets/reminder_item.dart';

class GameSessionArea extends StatefulWidget {
  const GameSessionArea({
    super.key,
    required this.gameSession,
    this.showPlayersNotes = false,
    this.showPlayersVotesNominations = false,
    required this.saveGameSession,
    required this.updateParent,
  });

  final GameSession gameSession;
  final bool showPlayersNotes;
  final bool showPlayersVotesNominations;
  final void Function() saveGameSession;
  final void Function() updateParent;

  @override
  State<GameSessionArea> createState() {
    return _GameSessionAreaState();
  }
}

class _GameSessionAreaState extends State<GameSessionArea> {
  bool get isLunaticInPlay {
    if (!widget.gameSession.isStorytellerMode) {
      return false;
    }

    return widget.gameSession.script.characters
        .where((character) => character.id == 'lunatic')
        .isNotEmpty;
  }

  void _onRemovePlayer(Player player) {
    setState(() {
      widget.gameSession.players.remove(player);
    });
    widget.saveGameSession();
  }

  void _onRemoveReminder(Player player, Reminder reminder) {
    setState(() {
      player.reminders!.remove(reminder);
    });
    widget.saveGameSession();
  }

  void _onSaveCustomInfoToken(CustomInfoToken customInfoToken) {
    final List<CustomInfoToken> updatedCustomInfoTokens = [
      ...widget.gameSession.customInfoTokensSimplified ?? []
    ];
    updatedCustomInfoTokens.add(customInfoToken);
    setState(() {
      widget.gameSession.setCustomInfoTokensSimplified =
          updatedCustomInfoTokens;
    });
    widget.saveGameSession();
  }

  void _onRemoveCustomInfoToken(int customInfoTokenIndex) {
    final List<CustomInfoToken> updatedCustomInfoTokens = [
      ...widget.gameSession.customInfoTokensSimplified ?? []
    ];
    updatedCustomInfoTokens.removeAt(customInfoTokenIndex);
    setState(() {
      widget.gameSession.setCustomInfoTokensSimplified =
          updatedCustomInfoTokens;
    });
    widget.saveGameSession();
  }

  void _updateGamePhase(String gamePhase) {
    if (widget.showPlayersVotesNominations && gamePhase.startsWith('D')) {
      for (final player in widget.gameSession.players) {
        player.setVotedToday = false;
        player.setNominatedToday = false;
      }
    }
    widget.gameSession.setGamePhase = gamePhase;
    widget.updateParent();
    widget.saveGameSession();
  }

  void _updateDemonBluff(int index, Character? newBluff) {
    if (widget.gameSession.demonBluffs == null) {
      return;
    }
    final List<Character?> updatedBluffs = [...widget.gameSession.demonBluffs!];
    updatedBluffs.removeAt(index);
    updatedBluffs.insert(index, newBluff);

    setState(() {
      widget.gameSession.setDemonBluffs = updatedBluffs;
    });
    widget.saveGameSession();
  }

  void _updateLunaticBluff(int index, Character? newBluff) {
    if (widget.gameSession.lunaticBluffs == null) {
      return;
    }

    final List<Character?> updatedBluffs = [
      ...widget.gameSession.lunaticBluffs!
    ];
    updatedBluffs.removeAt(index);
    updatedBluffs.insert(index, newBluff);

    setState(() {
      widget.gameSession.setLunaticBluffs = updatedBluffs;
    });
    widget.saveGameSession();
  }

  void _openNotes(double width) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: BoxConstraints(
        maxWidth: isScreenBiggerThanX(width, ScreenSize.md)
            ? kBreakpoints[ScreenSize.md]!
            : double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => EditNotes(
        notes: widget.gameSession.notes ?? '',
        saveNotes: (notes) {
          widget.gameSession.setNotes = notes;
          widget.saveGameSession();
          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _openInfoTokens() {
    if (widget.gameSession.isStorytellerMode) {
      selectToken(
          context,
          (ctx) => InfoTokenSelector(
                sessionCharacters: widget.gameSession.sessionCharacters,
                inPlayCharactersIds: widget.gameSession.inPlayCharactersIds,
                sessionReminders: widget.gameSession.reminders,
                tokenSlots: widget.gameSession.demonBluffs,
                customInfoTokens: widget.gameSession.customInfoTokens,
                saveCustomInfoToken: _onSaveCustomInfoToken,
                removeCustomInfoToken: _onRemoveCustomInfoToken,
              ));
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => InfoTokenManager(
        infoToken: widget.gameSession.playerInfoToken ?? '',
        saveInfoToken: (infoToken) {
          widget.gameSession.setPlayerInfoToken = infoToken;
          widget.saveGameSession();
        },
      ),
    );
  }

  // TODO: Refactor code to display player:item widgets in ellipsis/circular shape
  double _dp(double radians, double radiusX, double radiusY) {
    return sqrt(
        pow(radiusX * sin(radians), 2) + pow(radiusY * cos(radians), 2));
  }

  List<Player> _getPlayers(BoxConstraints constraints) {
    final players = [...widget.gameSession.players];
    // checks if position was already set for players list
    if (players.first.x != null) {
      return players;
    }

    final radiusX =
        (constraints.maxWidth - kCharacterTokenSizeSmall - kPlayerNotesSize) /
            2;
    final radiusY = (constraints.maxHeight - kCharacterTokenSizeSmall) / 2;
    final coordinates = [];
    double precision = 0.001;
    double offset = pi * 0.5;
    double circ = 0.0;
    for (double radians = 0 + offset;
        radians < (pi * 2 + offset);
        radians += precision) {
      circ += _dp(radians, radiusX, radiusY);
    }
    double nextPoint = 0;
    double run = 0.0;
    for (double radians = 0 + offset;
        radians < (pi * 2 + offset);
        radians += precision) {
      if ((players.length * run / circ) >= nextPoint) {
        nextPoint++;
        double x = radiusX + (cos(radians) * radiusX);
        double y = radiusY + (sin(radians) * radiusY);
        coordinates.add([x, y]);
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
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    final GameSession(
      :players,
      :gameSetup,
      :isStorytellerMode,
      :numberOfPlayers,
      :numberOfAlivePlayers,
      :numberOfGhostVotes,
      :numberOfVotesRequiredToExecute,
      :fabled,
      :gamePhase,
      :script,
      :inPlayCharactersIds,
      :sessionCharacters,
      :reminders,
      :demonBluffs,
      :lunaticBluffs
    ) = widget.gameSession;

    final bluffs = isStorytellerMode
        ? [
            Bluffs(
              title: t.demonBluffs,
              bluffs: demonBluffs!,
              sessionCharacters: sessionCharacters,
              inPlayCharactersIds: inPlayCharactersIds,
              updateBluff: _updateDemonBluff,
            ),
            const SizedBox(
              width: 32,
            ),
            if (isLunaticInPlay) ...[
              SizedBox(
                height: isLargeScreen ? null : 24,
                width: isLargeScreen ? 24 : null,
              ),
              Bluffs(
                title: t.lunaticBluffs,
                bluffs: lunaticBluffs!,
                sessionCharacters: sessionCharacters,
                updateBluff: _updateLunaticBluff,
              ),
            ]
          ]
        : [];

    return SliverToBoxAdapter(
        child: Column(
      children: [
        SizedBox(
          height: 600,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final players = _getPlayers(constraints);

              return Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GamePhase(
                        gamePhase: gamePhase,
                        onUpdateGamePhase: _updateGamePhase),
                    GameSetupTable(
                      gameSetup: gameSetup,
                      numberOfPlayers: numberOfPlayers,
                      numberOfAlivePlayers: numberOfAlivePlayers,
                      numberOfGhostVotes: numberOfGhostVotes,
                      numberOfVotesRequiredToExecute:
                          numberOfVotesRequiredToExecute,
                      fabled: fabled,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () => _openNotes(width),
                          label: Text(
                            t.notes,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          iconAlignment: IconAlignment.end,
                          icon: Icon(
                            Icons.edit_note,
                            color: theme.colorScheme.onSurface,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: _openInfoTokens,
                          label: Text(
                            'Tokens',
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          iconAlignment: IconAlignment.end,
                          icon: Icon(
                            Icons.info_outline,
                            color: theme.colorScheme.onSurface,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                for (final player in players) ...[
                  PlayerItem(
                    key: ValueKey(player.id),
                    player: player,
                    inPlayCharactersIds: inPlayCharactersIds,
                    sessionCharacters: sessionCharacters,
                    sessionReminders: reminders,
                    isStorytellerMode: isStorytellerMode,
                    showPlayersNotes: widget.showPlayersNotes,
                    showPlayersVotesNominations:
                        widget.showPlayersVotesNominations,
                    removePlayer: () {
                      _onRemovePlayer(player);
                    },
                    updateParent: widget.updateParent,
                    saveGameSession: widget.saveGameSession,
                    constraints: constraints,
                  ),
                  if (isStorytellerMode &&
                      player.reminders != null &&
                      player.reminders!.isNotEmpty)
                    for (final reminder in player.reminders!)
                      ReminderItem(
                          reminder: reminder,
                          constraints: constraints,
                          sessionCharacters: sessionCharacters,
                          removeReminder: () =>
                              _onRemoveReminder(player, reminder),
                          saveGameSession: widget.saveGameSession),
                ],
              ]);
            },
          ),
        ),
        if (isStorytellerMode)
          SizedBox(
            width: width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.surfaceContainer,
                  Theme.of(context).colorScheme.surface,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              margin: const EdgeInsets.only(top: 16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: isLargeScreen
                    ? Row(
                        children: [
                          ...bluffs,
                        ],
                      )
                    : Column(
                        children: [
                          ...bluffs,
                          const SizedBox(
                            height: 28,
                          ),
                        ],
                      ),
              ),
            ),
          ),
      ],
    ));
  }
}
