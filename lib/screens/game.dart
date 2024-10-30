import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/widgets/game_session_area.dart';
import 'package:my_botc_notes/screens/new_game.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/button_tab.dart';
import 'package:my_botc_notes/widgets/edit_notes.dart';
import 'package:my_botc_notes/widgets/game_menu.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/widgets/script_details_content.dart';
import 'package:my_botc_notes/widgets/show_info_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kGameSession = 'gameSession';

enum GameTab {
  setup,
  scriptDetails,
}

const gameTabsMetadata = {
  GameTab.setup: 'setup',
  GameTab.scriptDetails: 'script',
};

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  GameSession? _gameSession;

  void _addGame(
    BuildContext context,
  ) async {
    final newGameSession = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewGame(),
      ),
    );

    if (newGameSession == null) {
      return;
    }

    setState(() {
      _gameSession = newGameSession;
    });
    _saveGameSession();
  }

  GameTab _gameTab = GameTab.setup;

  void _toggleTab(GameTab tab) {
    setState(() {
      _gameTab = tab;
    });
  }

  Future<void> _fetchGameSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final gameSessionString = preferences.getString(kGameSession);

    if (gameSessionString != null) {
      _gameSession = GameSession.fromJson(json.decode(gameSessionString));
    }
  }

  void _saveGameSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final encodedSession = jsonEncode(
      _gameSession?.toJson(),
    );
    await preferences.setString(
      kGameSession,
      encodedSession,
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchGameSession();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final getTranslationKey = getTranslationKeyGetter(context);

    Widget content = SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*   Icon(Icons.error_outline,
                      size: 120, color: theme.colorScheme.primary),
                  const SizedBox(
                    height: 32,
                  ), */
            Text(
              t.noGame,
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _addGame(context);
              },
              label: Text(t.addGame),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );

    if (_gameSession != null && _gameTab == GameTab.scriptDetails) {
      content = ScriptDetailsContent(script: _gameSession!.script);
    }

    if (_gameSession != null && _gameTab == GameTab.setup) {
      content = GameSessionArea(
        gameSession: _gameSession!,
        saveGameSession: _saveGameSession,
      );
    }

    return Layout(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading:
                  isScreenSmallerThanX(width, ScreenSize.l),
              title: Text(
                  _gameSession == null ? t.game : _gameSession!.script.name),
              bottom: _gameSession == null
                  ? null
                  : PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                spacing: 4,
                                children: [
                                  for (final item in gameTabsMetadata.entries)
                                    ButtonTab(
                                      label: getTranslationKey(item.value),
                                      isSelected: _gameTab == item.key,
                                      onPressed: () => _toggleTab(
                                        item.key,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          GameMenu(
                            menuActions: {
                              MenuItem.addTraveller: () {
                                selectCharacter(
                                    context,
                                    characters
                                        .where((character) =>
                                            character.team == Team.traveller)
                                        .toList(), (character) {
                                  setState(() {
                                    _gameSession!.players
                                        .add(Player(characterId: character.id));
                                    _gameSession!.gameSetup.setTraveller =
                                        (_gameSession!.gameSetup.traveller ??
                                                0) +
                                            1;
                                  });
                                  _saveGameSession();
                                });
                              },
                              MenuItem.addFabled: () {
                                selectCharacter(
                                  context,
                                  characters
                                      .where((character) =>
                                          character.team == Team.fabled)
                                      .toList(),
                                  (character) {
                                    setState(() {
                                      _gameSession!.setFabled = character;
                                      _saveGameSession();
                                    });
                                  },
                                );
                              },
                              MenuItem.editNotes: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  constraints: const BoxConstraints(
                                    maxWidth: double.infinity,
                                  ),
                                  builder: (ctx) => EditNotes(
                                    notes: _gameSession!.notes ?? '',
                                    saveNotes: (notes) {
                                      _gameSession!.setNotes = notes;
                                      _saveGameSession();
                                      Navigator.pop(ctx);
                                    },
                                  ),
                                );
                              },
                              MenuItem.showInfoToken: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  constraints: const BoxConstraints(
                                    maxWidth: double.infinity,
                                  ),
                                  builder: (ctx) => ShowInfoToken(
                                    infoToken: _gameSession!.infoToken ?? '',
                                    saveInfoToken: (infoToken) {
                                      _gameSession!.setInfoToken = infoToken;
                                      _saveGameSession();
                                    },
                                  ),
                                );
                              },
                              MenuItem.delete: () {
                                setState(() {
                                  _gameSession = null;
                                  _saveGameSession();
                                });
                              },
                              MenuItem.share: () {},
                            },
                          ),
                        ],
                      ),
                    ),
              floating: true,
            ),
            content,
          ],
        ),
        floatingActionButton: _gameTab == GameTab.scriptDetails
            ? null
            : FloatingActionButton.small(
                onPressed: () {
                  if (_gameSession == null) {
                    _addGame(context);
                    return;
                  }

                  showDeleteGameDialog(
                      context, '${t.gameSetupExists} ${t.deleteGameAreYouSure}',
                      () {
                    setState(() {
                      _gameSession = null;
                      _saveGameSession();
                    });
                    _addGame(context);
                  });
                },
                foregroundColor: theme.colorScheme.surface,
                backgroundColor: theme.colorScheme.primary,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      ),
    );
  }
}
