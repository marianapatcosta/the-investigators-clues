import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/widgets/grimoire/storyteller_helper.dart';
import 'package:my_botc_notes/widgets/grimoire/grimoire.dart';
import 'package:my_botc_notes/screens/new_game.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/ui/button_tab.dart';
import 'package:my_botc_notes/widgets/grimoire/game_menu.dart';
import 'package:my_botc_notes/widgets/ui/layout.dart';
import 'package:my_botc_notes/widgets/scripts/script_details_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kGameSession = 'gameSession';

const kNewPlayerOffset = 50.0;

enum GameTab {
  setup,
  scriptDetails,
}

final gameTabsMetadata = {
  GameTab.setup: 'setup',
  GameTab.scriptDetails: 'script',
};

final scaffoldKey = GlobalKey<ScaffoldState>();

class GameScreen extends StatefulWidget {
  GameScreen({
    super.key,
  });

  GameSession? _gameSession;

  @override
  State<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  bool _showPlayersNotes = false;
  bool _showPlayersVotesNominations = false;

  void _addGame(
    BuildContext context,
  ) async {
    final GameSession? newGameSession = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewGame(),
      ),
    );

    if (newGameSession == null) {
      return;
    }

    setState(() {
      widget._gameSession = newGameSession;
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
      setState(() {
        widget._gameSession =
            GameSession.fromJson(json.decode(gameSessionString));
      });
    }
  }

  void _saveGameSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final encodedSession = jsonEncode(
      widget._gameSession?.toJson(),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 56,
          ),
          Stack(
            children: [
              Image(
                image: const AssetImage("assets/images/clocktower.png"),
                color: theme.colorScheme.primary,
                width: 150,
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Transform.scale(
                  scale: 0.55,
                  child: Image(
                    image: const AssetImage("assets/images/clock.png"),
                    color: theme.colorScheme.onPrimary,
                    width: 70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            t.noGame,
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 48,
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
    );

    if (widget._gameSession != null && _gameTab == GameTab.scriptDetails) {
      content = ScriptDetailsContent(
          script: widget._gameSession!.script,
          sessionCharacters: widget._gameSession!.sessionCharacters);
    }

    if (widget._gameSession != null && _gameTab == GameTab.setup) {
      content = GameSessionArea(
          gameSession: widget._gameSession!,
          showPlayersNotes: _showPlayersNotes,
          showPlayersVotesNominations: _showPlayersVotesNominations,
          saveGameSession: _saveGameSession,
          updateParent: () => setState(() {}));
    }

    return Layout(
      child: Scaffold(
        key: scaffoldKey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading:
                  isScreenSmallerThanX(width, ScreenSize.l),
              actions: <Widget>[
                Container()
              ], // hide default hamburger menu for open drawer
              title: Text(
                widget._gameSession == null
                    ? t.game
                    : widget._gameSession!.script.name,
              ),
              centerTitle: false,
              bottom: widget._gameSession == null
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
                          if (widget._gameSession != null &&
                              widget._gameSession!.isStorytellerMode &&
                              _gameTab == GameTab.setup)
                            Wrap(
                              spacing: 4,
                              children: [
                                IconButton(
                                  icon: const ImageIcon(
                                      AssetImage(
                                          "assets/images/fire_lighter.png"),
                                      size: 20,
                                      color: Colors.white),
                                  onPressed: () =>
                                      scaffoldKey.currentState?.openEndDrawer(),
                                ),
                                GameMenu(
                                  showPlayersNotes: _showPlayersNotes,
                                  showPlayersVotesNominations:
                                      _showPlayersVotesNominations,
                                  menuActions: {
                                    MenuItem.addTraveller: () {
                                      final travellers = characters
                                          .where((character) =>
                                              character.team == Team.traveller)
                                          .toList();
                                      final homebrewTravellers = [];
                                      if (widget._gameSession!.script
                                          .hasHomebrewCharacters) {
                                        for (final traveller in widget
                                            ._gameSession!.script.characters
                                            .where((character) =>
                                                character.team ==
                                                Team.traveller)
                                            .toList()) {
                                          if (travellers
                                              .where((item) =>
                                                  item.id == traveller.id)
                                              .isEmpty) {
                                            homebrewTravellers.add(traveller);
                                          }
                                        }
                                      }
                                      selectCharacter(context, [
                                        ...homebrewTravellers,
                                        ...travellers
                                      ], (character) {
                                        setState(() {
                                          widget._gameSession!.players.add(
                                            Player(
                                              characterId: character?.id,
                                              x: kNewPlayerOffset,
                                              y: kNewPlayerOffset,
                                            ),
                                          );
                                          widget._gameSession!.gameSetup
                                              .setTraveller = (widget
                                                      ._gameSession!
                                                      .gameSetup
                                                      .traveller ??
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
                                            widget._gameSession!.setFabled =
                                                character!;
                                            _saveGameSession();
                                          });
                                        },
                                      );
                                    },
                                    MenuItem.showPlayersNotes: () {
                                      setState(() {
                                        if (!_showPlayersNotes &&
                                            _showPlayersVotesNominations) {
                                          _showPlayersVotesNominations = false;
                                        }
                                        _showPlayersNotes = !_showPlayersNotes;
                                      });
                                    },
                                    MenuItem.showVotesNominations: () {
                                      setState(() {
                                        if (!_showPlayersVotesNominations &&
                                            _showPlayersNotes) {
                                          _showPlayersNotes = false;
                                        }
                                        _showPlayersVotesNominations =
                                            !_showPlayersVotesNominations;
                                      });
                                    },
                                    MenuItem.delete: () {
                                      setState(() {
                                        widget._gameSession = null;
                                        _saveGameSession();
                                      });
                                    },
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
              floating: true,
            ),
            content,
          ],
        ),
        floatingActionButton: _gameTab != GameTab.setup
            ? null
            : FloatingActionButton.small(
                onPressed: () {
                  if (widget._gameSession == null) {
                    _addGame(context);
                    return;
                  }

                  showDeleteGameDialog(
                      context, '${t.gameSetupExists} ${t.deleteGameAreYouSure}',
                      () {
                    _addGame(context);
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      setState(() {
                        widget._gameSession = null;
                        _saveGameSession();
                      });
                    });
                  });
                },
                foregroundColor: theme.colorScheme.surface,
                backgroundColor: theme.colorScheme.primary,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
        endDrawer: _gameTab == GameTab.setup &&
                widget._gameSession != null &&
                widget._gameSession!.isStorytellerMode
            ? StorytellerHelper(
                characters: widget._gameSession!.sessionCharacters,
                inPlayCharactersIds: widget._gameSession!.inPlayCharactersIds,
                alivePlayersCharactersIds:
                    widget._gameSession!.alivePlayersCharactersIds,
                alivePlayersWithoutAbilityCharactersIds: widget
                    ._gameSession!.alivePlayersWithoutAbilityCharactersIds,
                gamePhase: widget._gameSession!.gamePhase,
                hasHomebrewCharacters:
                    widget._gameSession!.script.hasHomebrewCharacters,
                jinxes: widget._gameSession!.script.jinxes,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      ),
    );
  }
}
