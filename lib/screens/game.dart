import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/providers/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show characters;
import 'package:my_botc_notes/models/index.dart'
    show Character, GameSession, Player, Team;
import 'package:my_botc_notes/widgets/index.dart'
    show
        ButtonTab,
        CustomSafeArea,
        GameHistoryContent,
        GameMenu,
        Grimoire,
        Layout,
        MenuItem,
        ScriptDetailsContent,
        StorytellerHelper,
        GrimoireSettings;
import 'package:my_botc_notes/screens/new_game.dart';
import 'package:my_botc_notes/utils.dart';

const kGameSession = 'gameSession';

const kNewPlayerOffset = 50.0;
double kMinScale = 0.5;
double kMaxScale = 2;

enum GameTab { setup, scriptDetails, gameHistory }

final gameTabsMetadata = {
  GameTab.setup: 'setup',
  GameTab.gameHistory: 'history',
  GameTab.scriptDetails: 'script',
};

final scaffoldKey = GlobalKey<ScaffoldState>();

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  ConsumerState<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends ConsumerState<GameScreen>
    with AutomaticKeepAliveClientMixin {
  GameSession? gameSession;
  bool _isScrollLocked = false;
  bool _showAllCharactersInStorytellerHelper = false;
  bool _showDeadCharactersInStorytellerHelper = false;

  @override
  bool get wantKeepAlive => true;

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
      gameSession = newGameSession;
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

    if (gameSessionString != null && gameSessionString != 'null') {
      setState(() {
        gameSession = GameSession.fromJson(json.decode(gameSessionString));
      });
    }
  }

  void _saveGameSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final encodedSession = jsonEncode(
      gameSession?.toJson(),
    );
    await preferences.setString(
      kGameSession,
      encodedSession,
    );
  }

  void _onAddPlayer(List<Character> playerCharacters, [isTraveller = false]) {
    selectCharacter(context, playerCharacters, (character) {
      setState(() {
        gameSession!.players.add(
          Player(
            characterId: character?.id,
            x: kNewPlayerOffset,
            y: kNewPlayerOffset,
            isTraveller: isTraveller,
          ),
        );
      });
      _saveGameSession();
    }, true);
  }

  List<Character> _getAllCharactersFromTeam(Team team) {
    final existingCharacters =
        characters.where((character) => character.team == team).toList();
    final homebrew = [];
    if (gameSession!.script.hasHomebrewCharacters) {
      for (final character in gameSession!.script.characters
          .where((character) => character.team == team)
          .toList()) {
        if (existingCharacters
            .where((item) => item.id == character.id)
            .isEmpty) {
          homebrew.add(character);
        }
      }
    }

    return [...homebrew, ...existingCharacters];
  }

  void _onAddTraveller() {
    final travellers = _getAllCharactersFromTeam(Team.traveller);
    _onAddPlayer(travellers, true);
  }

  void _onAddFabled() {
    final fabled = _getAllCharactersFromTeam(Team.fabled);

    selectCharacter(context, fabled, (character) {
      if (character != null) {
        setState(() {
          gameSession!.setFabled = character;
        });
      }
      _saveGameSession();
    });
  }

  void _onOpenGrimoireSettings() {
    final width = MediaQuery.of(context).size.width;

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
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return GrimoireSettings();
          });
        });
  }

  @override
  void initState() {
    super.initState();
    _fetchGameSession();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final getTranslationKey = getTranslationKeyGetter(context);
    final settings = ref.watch(settingsProvider);

    Widget content = SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/clocktower.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.noGame,
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
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
        ),
      ),
    );

    if (gameSession != null && _gameTab == GameTab.scriptDetails) {
      content = ScriptDetailsContent(
          script: gameSession!.script,
          sessionCharacters: gameSession!.sessionCharacters);
    }

    if (gameSession != null && _gameTab == GameTab.gameHistory) {
      content = GameHistoryContent(
        gameHistory: gameSession!.gameHistory,
        isStorytellerMode: gameSession!.isStorytellerMode,
        saveGameSession: _saveGameSession,
      );
    }

    if (gameSession != null && _gameTab == GameTab.setup) {
      content = SliverToBoxAdapter(
          child: Grimoire(
              gameSession: gameSession!,
              saveGameSession: _saveGameSession,
              updateParent: () => setState(
                    () {},
                  )));
    }

    return Layout(
      child: Scaffold(
        key: scaffoldKey,
        body: CustomSafeArea(
          child: CustomScrollView(
            physics: _isScrollLocked && _gameTab == GameTab.setup
                ? const NeverScrollableScrollPhysics()
                : null,
            slivers: [
              SliverAppBar(
                expandedHeight: kTabsAppBarHeight,
                automaticallyImplyLeading:
                    isScreenSmallerThanX(width, ScreenSize.l),
                actions: <Widget>[
                  Container()
                ], // hide default hamburger menu for open drawer
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        gameSession == null ? t.game : gameSession!.script.name,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: Tween<double>(begin: 0, end: 1)
                                  .animate(animation),
                              child: child,
                            );
                          },
                          child: settings.themeMode == ThemeMode.light
                              ? Transform.rotate(
                                  angle: 3,
                                  child: Icon(
                                    Icons.nightlight,
                                    key: const ValueKey('dark-theme'),
                                    size: 20,
                                    semanticLabel: t.darkTheme,
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  Icons.sunny,
                                  key: const ValueKey('light-theme'),
                                  size: 20,
                                  color: Colors.white,
                                  semanticLabel: t.lightTheme,
                                ),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => setState(() {
                              final newValue =
                                  settings.themeMode == ThemeMode.light
                                      ? ThemeMode.dark
                                      : ThemeMode.light;
                              ref
                                  .read(settingsProvider.notifier)
                                  .setTheme(newValue);
                            })),
                  ],
                ),
                centerTitle: false,
                bottom: gameSession == null
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
                            Wrap(
                              spacing: 4,
                              children: [
                                if (_gameTab == GameTab.setup)
                                  IconButton(
                                      icon: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          transitionBuilder:
                                              (child, animation) {
                                            return ScaleTransition(
                                              scale: Tween<double>(
                                                      begin: 0, end: 1)
                                                  .animate(animation),
                                              child: child,
                                            );
                                          },
                                          child: _isScrollLocked
                                              ? ImageIcon(
                                                  key: const ValueKey(
                                                      'scroll-locked'),
                                                  const AssetImage(
                                                      "assets/images/lock.png"),
                                                  size: 20,
                                                  semanticLabel: t.unlockScroll,
                                                  color: Colors.white,
                                                )
                                              : ImageIcon(
                                                  key: const ValueKey(
                                                      'scroll-unlocked'),
                                                  const AssetImage(
                                                      "assets/images/unlock.png"),
                                                  size: 20,
                                                  color: Colors.white,
                                                  semanticLabel: t.lockScroll,
                                                )),
                                      onPressed: () => setState(() {
                                            _isScrollLocked = !_isScrollLocked;
                                          })),
                                if (gameSession != null &&
                                    gameSession!.isStorytellerMode &&
                                    _gameTab == GameTab.setup)
                                  IconButton(
                                    icon: ImageIcon(
                                      const AssetImage(
                                          "assets/images/fire_lighter.png"),
                                      size: 20,
                                      color: Colors.white,
                                      semanticLabel: t.storytellerHelper,
                                    ),
                                    onPressed: () => scaffoldKey.currentState
                                        ?.openEndDrawer(),
                                  ),
                                GameMenu(
                                  menuActions: {
                                    MenuItem.addPlayer: () => _onAddPlayer(
                                        gameSession!.script.characters
                                            .where((character) =>
                                                character.team !=
                                                    Team.traveller &&
                                                character.team != Team.fabled)
                                            .toList()),
                                    MenuItem.addTraveller: _onAddTraveller,
                                    MenuItem.addFabled: _onAddFabled,
                                    MenuItem.grimoireSettings:
                                        _onOpenGrimoireSettings,
                                    MenuItem.delete: () {
                                      showDeleteGameDialog(
                                          context, t.deleteGameAreYouSure, () {
                                        setState(() {
                                          gameSession = null;
                                          _saveGameSession();
                                        });
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
        ),
        floatingActionButton: _gameTab != GameTab.setup
            ? null
            : FloatingActionButton.small(
                onPressed: () {
                  if (gameSession == null) {
                    _addGame(context);
                    return;
                  }

                  showDeleteGameDialog(
                      context, '${t.gameSetupExists} ${t.deleteGameAreYouSure}',
                      () {
                    _addGame(context);
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      setState(() {
                        gameSession = null;
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
                gameSession != null &&
                gameSession!.isStorytellerMode
            ? StorytellerHelper(
                characters: gameSession!.sessionCharacters,
                inPlayCharactersIds: gameSession!.inPlayCharactersIds,
                alivePlayersCharactersIds:
                    gameSession!.alivePlayersCharactersIds,
                alivePlayersWithoutAbilityCharactersIds:
                    gameSession!.alivePlayersWithoutAbilityCharactersIds,
                gamePhase: gameSession!.gamePhase,
                hasHomebrewCharacters:
                    gameSession!.script.hasHomebrewCharacters,
                jinxes: gameSession!.script.jinxes,
                showAllCharacters: _showAllCharactersInStorytellerHelper,
                showDeadCharacters: _showDeadCharactersInStorytellerHelper,
                toggleShowAllCharacters: () {
                  setState(() {
                    _showAllCharactersInStorytellerHelper =
                        !_showAllCharactersInStorytellerHelper;
                  });
                },
                toggleShowDeadCharacters: () {
                  setState(() {
                    _showDeadCharactersInStorytellerHelper =
                        !_showDeadCharactersInStorytellerHelper;
                  });
                },
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      ),
    );
  }
}
