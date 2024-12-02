import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/game_setup.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/providers/favorite_scripts_provider.dart';
import 'package:my_botc_notes/screens/draw_characters_to_players.dart';
import 'package:my_botc_notes/screens/draw_characters_to_players_with_numbers.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/characters_manager.dart';
import 'package:my_botc_notes/widgets/form_action_bar.dart';
import 'package:my_botc_notes/widgets/number_players_slider.dart';
import 'package:my_botc_notes/widgets/script_selector.dart';

class NewGameStorytellerForm extends ConsumerStatefulWidget {
  const NewGameStorytellerForm({
    super.key,
  });

  @override
  ConsumerState<NewGameStorytellerForm> createState() {
    return _NewGameStorytellerFormState();
  }
}

class _NewGameStorytellerFormState
    extends ConsumerState<NewGameStorytellerForm> {
  Script? _selectedScript;
  double _numberOfPlayers = 10;
  List<Character> _selectedScriptCharacters = [];
  List<Character> _demonBluffs = [];
  List<Character> _lunaticBluffs = [];
  List<Player>? _players;

  List<Character> get demonsBluffsOptions {
    if (_selectedScript == null) {
      return [];
    }
    final scriptCharactersIds =
        _selectedScriptCharacters.map((character) => character.id).toList();
    return _selectedScript!.characters
        .where((character) =>
            !scriptCharactersIds.contains(character.id) &&
            (character.team == Team.townsfolk ||
                character.team == Team.outsider))
        .toList();
  }

  GameSetup get gameSetup {
    return gameSetups[_numberOfPlayers.round().toString()]!;
  }

  bool get isLunaticInPlay {
    if (_selectedScript == null) {
      return false;
    }

    return _selectedScriptCharacters
        .where((character) => character.id == 'lunatic')
        .isNotEmpty;
  }

  void _onUpdatePlayersNumber(double newValue) {
    setState(() {
      _numberOfPlayers = newValue;
    });
  }

  void _updateScriptCharacters(List<Character> scriptCharacters) {
    final List<Character> orderedCharacters = [];
    for (final selectedScriptCharacter in _selectedScript!.characters) {
      final currentCharacters = scriptCharacters
          .where((character) => character.id == selectedScriptCharacter.id)
          .toList();
      if (currentCharacters.isNotEmpty) {
        orderedCharacters.addAll(currentCharacters);
      }
    }

    setState(() {
      _selectedScriptCharacters = orderedCharacters;
    });
  }

  void _updateDemonBluffs(List<Character> bluffs) {
    setState(() {
      _demonBluffs = bluffs;
    });
  }

  void _updateLunaticBluffs(List<Character> bluffs) {
    setState(() {
      _lunaticBluffs = bluffs;
    });
  }

  void _onSelectScript(Script? script) {
    setState(() {
      _selectedScript = script;
      if (_selectedScriptCharacters.isNotEmpty) {
        _selectedScriptCharacters = [];
      }

      if (_demonBluffs.isNotEmpty) {
        _demonBluffs = [];
      }

      if (_lunaticBluffs.isNotEmpty) {
        _lunaticBluffs = [];
      }
    });
  }

  void _onSave(BuildContext context) {
    final t = AppLocalizations.of(context);
    final List<String> warnings = [];

    if (_selectedScript == null ||
        _numberOfPlayers < kMinNumberPlayers ||
        _numberOfPlayers > kMaxNumberPlayers) {
      warnings.add(t.invalidPlayersNumber);
    }

    if (_selectedScriptCharacters.length != _numberOfPlayers) {
      warnings.add(t.invalidNumberOfCharacters(_numberOfPlayers.toInt()));
    }

    final charactersWhoCannotBeInTheBag = _selectedScriptCharacters
        .where((character) => character.bagDisabled)
        .toList();

    if (charactersWhoCannotBeInTheBag.isNotEmpty) {
      final charactersWhoCannotBeInTheBagNames = charactersWhoCannotBeInTheBag
          .map((character) => character.name)
          .toList();

      warnings.add(
          '${t.invalidCharactersInTheBag} ${charactersWhoCannotBeInTheBagNames.join(', ')}.');
    }

    if (_demonBluffs.length != kDemonBluffsNumber) {
      warnings.add(t.invalidDemonBluffs);
    }

    if (isLunaticInPlay && _lunaticBluffs.length != kDemonBluffsNumber) {
      warnings.add(t.invalidLunaticBluffs);
    }

    if (warnings.isNotEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            t.invalidSetup,
            style: const TextStyle(fontFamily: 'Dumbledore'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final warning in warnings) ...[
                Text(
                  '- $warning',
                ),
                const SizedBox(
                  height: 8,
                )
              ],
              const SizedBox(
                height: 18,
              ),
              Text(
                t.proceedAnyway,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(t.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _createSession();
              },
              child: Text(t.yes),
            )
          ],
        ),
      );
      return;
    }

    _createSession();
  }

  void _createSession() {
    if (_players == null) {
      final charactersToShuffle = [..._selectedScriptCharacters];
      charactersToShuffle.shuffle();

      _players = List.generate(
        _numberOfPlayers.toInt(),
        (index) => Player(
            name: '',
            characterId: index < charactersToShuffle.length
                ? charactersToShuffle[index].id
                : null),
      );
    }

    Navigator.of(context).pop(
      GameSession(
          gameSetup: gameSetup,
          script: _selectedScript!,
          players: _players!,
          isStorytellerMode: true,
          demonBluffs: _getBluffs(_demonBluffs),
          lunaticBluffs: _getBluffs(_lunaticBluffs)),
    );
  }

  List<Character?> _getBluffs(List<Character?>? bluffs) {
    if (bluffs != null && bluffs.length == kDemonBluffsNumber) {
      return bluffs;
    }

    final emptyBluffsNumber = kDemonBluffsNumber - (bluffs?.length ?? 0);
    final emptyBluffs = List.generate(emptyBluffsNumber, (index) => null);
    return [...bluffs ?? [], ...emptyBluffs];
  }

  void _drawCharacters(BuildContext context) async {
    final charactersToShuffle = [..._selectedScriptCharacters];
    charactersToShuffle.shuffle();
    final List<Player>? players = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => DrawCharactersToPlayersScreen(
          scriptCharacters: charactersToShuffle,
        ),
      ),
    );

    if (players != null) {
      _players = players;
    }
  }

  void _drawCharactersWithNumbers(BuildContext context) async {
    final charactersToShuffle = [..._selectedScriptCharacters];
    charactersToShuffle.shuffle();
    final List<Player>? players = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => DrawCharactersToPlayersWithNumbersScreen(
          scriptCharacters: charactersToShuffle,
        ),
      ),
    );

    if (players != null) {
      _players = players;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    final bluffsWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharactersManager(
          title: '${t.select} ${t.demonBluffs}',
          characters: demonsBluffsOptions,
          selectedCharacters: _demonBluffs,
          numberOfCharactersToSelect: kDemonBluffsNumber,
          saveCharacters: _updateDemonBluffs,
        ),
        const SizedBox(height: 8),
        if (isLunaticInPlay) ...[
          CharactersManager(
            title: '${t.select} ${t.lunaticBluffs}',
            characters: _selectedScript!.characters
                .where((character) =>
                    character.team == Team.townsfolk ||
                    character.team == Team.outsider)
                .toList(),
            selectedCharacters: _lunaticBluffs,
            numberOfCharactersToSelect: kDemonBluffsNumber,
            saveCharacters: _updateLunaticBluffs,
          ),
          const SizedBox(height: 8),
        ],
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLargeScreen) ...[
          Row(
            children: [
              Expanded(
                child: ScriptSelector(
                    selectedScript: _selectedScript,
                    favoriteScripts: ref.watch(favoriteScriptsProvider),
                    onSelectScript: _onSelectScript),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: NumberPlayersSlider(
                    numberOfPlayers: _numberOfPlayers,
                    gameSetup: gameSetup,
                    onUpdatePlayersNumber: _onUpdatePlayersNumber),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          if (_selectedScript != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CharactersManager(
                    title: '${t.select} ${t.characters}',
                    characters: _selectedScript!.characters
                        .where((character) => character.team != Team.traveller)
                        .toList(),
                    selectedCharacters: _selectedScriptCharacters,
                    numberOfCharactersToSelect: _numberOfPlayers.toInt(),
                    gameSetup: gameSetup,
                    allowMoreThanOneOfSameCharacter: true,
                    saveCharacters: _updateScriptCharacters,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: bluffsWidget,
                ),
              ],
            )
        ] else ...[
          ScriptSelector(
              selectedScript: _selectedScript,
              favoriteScripts: ref.watch(favoriteScriptsProvider),
              onSelectScript: _onSelectScript),
          const SizedBox(height: 24),
          NumberPlayersSlider(
              numberOfPlayers: _numberOfPlayers,
              gameSetup: gameSetup,
              onUpdatePlayersNumber: _onUpdatePlayersNumber),
          const SizedBox(height: 12),
          if (_selectedScript != null) ...[
            CharactersManager(
              title: '${t.select} ${t.characters}',
              characters: _selectedScript!.characters
                  .where((character) => character.team != Team.traveller)
                  .toList(),
              selectedCharacters: _selectedScriptCharacters,
              numberOfCharactersToSelect: _numberOfPlayers.toInt(),
              gameSetup: gameSetup,
              allowMoreThanOneOfSameCharacter: true,
              saveCharacters: _updateScriptCharacters,
            ),
            const SizedBox(height: 8),
            bluffsWidget,
          ],
        ],
        if (_selectedScript != null &&
            _selectedScriptCharacters.isNotEmpty) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => _drawCharacters(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  minimumSize: const Size(120, 40),
                ),
                icon: const ImageIcon(AssetImage("assets/images/bag.png"),
                    size: 18),
                label: Text(t.drawCharacters),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () => _drawCharactersWithNumbers(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  minimumSize: const Size(120, 40),
                ),
                icon: const ImageIcon(
                    AssetImage("assets/images/circle_one.png"),
                    size: 18),
                label: Text(t.drawCharacters),
              ),
            ],
          )
        ],
        const SizedBox(height: 48),
        Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: FormActionBar(onSave: () => _onSave(context)))
      ],
    );
  }
}
