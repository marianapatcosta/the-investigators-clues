import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart';
import 'package:my_botc_notes/models/index.dart'
    show Character, CustomInfoToken, GameSession, Player, Reminder;
import 'package:my_botc_notes/providers/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show
        Bluffs,
        EditNotes,
        GamePhase,
        GameSetupTable,
        InfoTokenSelector,
        InfoTokenManager,
        PlayerItem,
        ReminderItem;

class Grimoire extends ConsumerStatefulWidget {
  const Grimoire({
    super.key,
    required this.gameSession,
    required this.saveGameSession,
    required this.updateParent,
  });

  final GameSession gameSession;
  final void Function() saveGameSession;
  final void Function() updateParent;

  @override
  ConsumerState<Grimoire> createState() {
    return _GrimoireState();
  }
}

class _GrimoireState extends ConsumerState<Grimoire> {
  bool get isLunaticInPlay {
    if (!widget.gameSession.isStorytellerMode) {
      return false;
    }

    return widget.gameSession.sessionCharacters
        .where((character) => character.id == 'lunatic')
        .isNotEmpty;
  }

  List<String> get firstNightOrder {
    if (widget.gameSession.script.hasHomebrewCharacters) {
      final sortedCharacters = [
        ...widget.gameSession.sessionCharacters,
      ]
          .where((character) =>
              character.firstNight != null && character.firstNight != 0)
          .toList()
        ..sort((characterA, characterB) =>
            characterA.firstNight!.compareTo(characterB.firstNight!));

      return sortedCharacters.map((character) => character.id).toList();
    }

    return nightOrder['firstNight']!
        .where((item) => widget.gameSession.inPlayCharactersIds.contains(item))
        .toList();
  }

  List<String> get otherNightsOrder {
    if (widget.gameSession.script.hasHomebrewCharacters) {
      final sortedCharacters = [
        ...widget.gameSession.sessionCharacters,
      ]
          .where((character) =>
              widget.gameSession.inPlayCharactersIds.contains(character.id) &&
              character.otherNight != null &&
              character.otherNight != 0)
          .toList()
        ..sort((characterA, characterB) =>
            characterA.otherNight!.compareTo(characterB.otherNight!));

      return sortedCharacters.map((character) => character.id).toList();
    }

    return nightOrder['otherNight']!
        .where((item) => widget.gameSession.inPlayCharactersIds.contains(item))
        .toList();
  }

  int? _getCharacterOrder(String? characterId, NightType nightType) {
    if (characterId == null) {
      return null;
    }

    final order =
        nightType == NightType.first ? firstNightOrder : otherNightsOrder;

    final index = order.indexOf(characterId);

    return index == -1 ? null : index + 1;
  }

  void _onRemovePlayer(Player player) {
    setState(() {
      widget.gameSession.players.remove(player);
    });
    widget.saveGameSession();
  }

  void _onRemoveReminder(Reminder reminder) {
    final updatedReminders = widget.gameSession.inPlayReminders!
        .where((sessionReminder) => sessionReminder.id != reminder.id)
        .toList();

    setState(() {
      widget.gameSession.setInPlayReminders = updatedReminders;
    });
    widget.saveGameSession();
  }

  void _onAddReminders(List<Reminder> newReminders) {
    setState(() {
      final reminders = widget.gameSession.inPlayReminders ?? [];

      widget.gameSession.setInPlayReminders = [...reminders, ...newReminders];
    });
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
    final settings = ref.watch(settingsProvider);

    if (settings.showVotingPhase && gamePhase.startsWith('D')) {
      for (final player in widget.gameSession.players) {
        player.setVotedToday = false;
        player.setNominatedToday = false;
        player.setWasNominatedToday = false;
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

  void _onRemoveFabled() {
    setState(() {
      widget.gameSession!.setFabled = null;
    });

    widget.saveGameSession();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    final grimoireSize = getGrimoireSize(context);
    final settings = ref.watch(settingsProvider);

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
      :lunaticBluffs,
      :inPlayReminders,
      :gameHistory,
      :currentGameHistoryItem,
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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(children: [
        SizedBox(
          height: grimoireSize.height,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (settings.showGamePhase)
                  GamePhase(
                      gamePhase: gamePhase,
                      onUpdateGamePhase: _updateGamePhase),
                if (settings.showGameSetup)
                  GameSetupTable(
                    gameSetup: gameSetup,
                    numberOfPlayers: numberOfPlayers,
                    numberOfAlivePlayers: numberOfAlivePlayers,
                    numberOfGhostVotes: numberOfGhostVotes,
                    numberOfVotesRequiredToExecute:
                        numberOfVotesRequiredToExecute,
                    fabled: fabled,
                    removeFabled: _onRemoveFabled,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                      ),
                    )
                  ],
                ),
              ],
            ),
            for (final player in widget.gameSession.players) ...[
              PlayerItem(
                key: ValueKey(player.id),
                player: player,
                inPlayCharactersIds: inPlayCharactersIds,
                sessionCharacters: sessionCharacters,
                sessionReminders: reminders,
                isStorytellerMode: isStorytellerMode,
                gamePhase: gamePhase,
                gameHistory: currentGameHistoryItem,
                firstNightOrder:
                    _getCharacterOrder(player.characterId, NightType.first),
                otherNightsOrder:
                    _getCharacterOrder(player.characterId, NightType.other),
                removePlayer: () {
                  _onRemovePlayer(player);
                },
                updateParent: widget.updateParent,
                saveGameSession: widget.saveGameSession,
                addReminders: _onAddReminders,
              ),
            ],
            if (inPlayReminders != null && inPlayReminders.isNotEmpty)
              for (final reminder in inPlayReminders)
                ReminderItem(
                    key: ValueKey(reminder.id),
                    reminder: reminder,
                    sessionCharacters: sessionCharacters,
                    removeReminder: () => _onRemoveReminder(reminder),
                    saveGameSession: widget.saveGameSession),
          ]),
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: isLargeScreen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
      ]);
    });
  }
}
