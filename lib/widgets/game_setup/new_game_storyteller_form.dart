import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show gameSetups;
import 'package:my_botc_notes/models/index.dart'
    show
        BagDisabledReminder,
        Character,
        GameSession,
        GameSetup,
        Player,
        Reminder,
        Script,
        Team;
import 'package:my_botc_notes/screens/index.dart'
    show
        DrawCharactersToPlayersScreen,
        DrawCharactersToPlayersWithNumbersScreen;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharactersManager, FormActionBar;

class NewGameStorytellerForm extends StatefulWidget {
  const NewGameStorytellerForm({
    super.key,
    required this.selectedScript,
    required this.numberOfPlayers,
  });

  final Script? selectedScript;
  final double numberOfPlayers;

  @override
  State<NewGameStorytellerForm> createState() {
    return _NewGameStorytellerFormState();
  }
}

class _NewGameStorytellerFormState extends State<NewGameStorytellerForm> {
  List<Character> _selectedScriptCharacters = [];
  List<Character> _demonBluffs = [];
  List<Character> _lunaticBluffs = [];
  List<Player> _players = [];
  bool _addRemindersFirstNight = true;
  List<BagDisabledReminder> _bagDisabledReminders = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);

    if (old.selectedScript?.id != widget.selectedScript?.id) {
      _bagDisabledReminders = _getBagDisabledReminders();
      if (_selectedScriptCharacters.isNotEmpty) {
        _selectedScriptCharacters = [];
      }

      if (_demonBluffs.isNotEmpty) {
        _demonBluffs = [];
      }

      if (_lunaticBluffs.isNotEmpty) {
        _lunaticBluffs = [];
      }
    }
  }

  List<Reminder> get remindersFirstNight {
    if (_selectedScriptCharacters.isEmpty) {
      return [];
    }
    return _players
        .map((player) {
          final Character playerCharacter = _selectedScriptCharacters
              .where((character) => character.id == player.characterId)
              .first;

          final List<Reminder> remindersFirstNight = getRemindersFirstNight(
              player.x!, player.y!, playerCharacter, context);

          return remindersFirstNight;
        })
        .expand((i) => i)
        .toList();
  }

  Size get grimoireSize {
    return getGrimoireSize(context);
  }

  GameSetup get gameSetup {
    return gameSetups[widget.numberOfPlayers.toInt().toString()]!.copyWith();
  }

  bool get isLunaticInPlay {
    if (widget.selectedScript == null) {
      return false;
    }

    return _selectedScriptCharacters
        .where((character) => character.id == 'lunatic')
        .isNotEmpty;
  }

  List<Character> get demonsBluffsOptions {
    if (widget.selectedScript == null) {
      return [];
    }
    final scriptCharactersIds =
        _selectedScriptCharacters.map((character) => character.id).toList();
    return widget.selectedScript!.characters
        .where((character) =>
            !scriptCharactersIds.contains(character.id) &&
            (character.team == Team.townsfolk ||
                character.team == Team.outsider))
        .toList();
  }

  List<BagDisabledReminder> _getBagDisabledReminders() {
    if (widget.selectedScript == null) {
      return [];
    }

    final bagDisabledCharacters = widget.selectedScript!.characters
        .where((character) =>
            character.bagDisabled && character.remindersGlobal != null)
        .toList();

    return bagDisabledCharacters.asMap().entries.map((entry) {
      final index = entry.key;
      final character = entry.value;
      final reminderOffset = getReminderOffset(20, 20, context, index);
      return BagDisabledReminder(
        reminder: Reminder(
          characterId: character.id,
          reminder: character.remindersGlobal!.first,
          x: reminderOffset.dx,
          y: reminderOffset.dy,
        ),
      );
    }).toList();
  }

  void _updateScriptCharacters(List<Character> scriptCharacters) {
    final List<Character> orderedCharacters = [];
    for (final selectedScriptCharacter in widget.selectedScript!.characters) {
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

  void _onSave(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (widget.selectedScript == null ||
        widget.numberOfPlayers < kMinNumberPlayers ||
        widget.numberOfPlayers > kMaxNumberPlayers) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            t.invalidSetup,
            style: const TextStyle(fontFamily: 'Dumbledore'),
          ),
          content: Text(
            t.invalidPlayersNumber,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final List<String> warnings = [];
    if (_selectedScriptCharacters.length != widget.numberOfPlayers) {
      warnings.add(t.invalidNumberOfCharacters(widget.numberOfPlayers.toInt()));
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
    if (_players.isEmpty || _players.length < widget.numberOfPlayers) {
      final shuffledCharacters = [..._selectedScriptCharacters]..shuffle();

      _players = List.generate(
        widget.numberOfPlayers.toInt(),
        (index) {
          final offset = getPlayerOffset(
              grimoireSize, widget.numberOfPlayers.toInt(), index);
          return Player(
              name: (index + 1).toString(),
              characterId: index < shuffledCharacters.length
                  ? shuffledCharacters[index].id
                  : null,
              x: offset.dx,
              y: offset.dy);
        },
      );
    }

    final List<Reminder> inPlayReminders =
        _addRemindersFirstNight ? remindersFirstNight : [];
    final bagReminders = _bagDisabledReminders
        .where((reminder) => reminder.addToGrimoire)
        .map((reminder) => reminder.reminder)
        .toList();

    if (bagReminders.isNotEmpty) {
      inPlayReminders.addAll(bagReminders);
    }

    Navigator.of(context).pop(
      GameSession(
          script: widget.selectedScript!,
          players: _players,
          inPlayReminders: inPlayReminders,
          isStorytellerMode: true,
          demonBluffs: _getBluffs(_demonBluffs),
          lunaticBluffs: _getBluffs(_lunaticBluffs)),
    );
  }

  List<Character?> _getBluffs(List<Character?>? bluffs) {
    if (bluffs != null && bluffs.length == kDemonBluffsNumber) {
      return bluffs;
    }

    final bluffsLength = bluffs?.length ?? 0;

    final emptyBluffsNumber = bluffsLength > kDemonBluffsNumber
        ? 0
        : kDemonBluffsNumber - bluffsLength;
    final emptyBluffs = List.generate(emptyBluffsNumber, (index) => null);
    return [...bluffs ?? [], ...emptyBluffs];
  }

  void _drawCharacters(BuildContext context) async {
    final shuffledCharacters = [..._selectedScriptCharacters]..shuffle();
    final List<Player>? players = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => DrawCharactersToPlayersScreen(
          charactersToDraw: shuffledCharacters,
        ),
      ),
    );

    if (players != null) {
      _players = players;
    }
  }

  void _drawCharactersWithNumbers(BuildContext context) async {
    final shuffledCharacters = [..._selectedScriptCharacters]..shuffle();
    final List<Player>? players = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => DrawCharactersToPlayersWithNumbersScreen(
          charactersToDraw: shuffledCharacters,
        ),
      ),
    );

    if (players != null) {
      _players = players;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            characters: widget.selectedScript!.characters
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
          if (widget.selectedScript != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CharactersManager(
                    title: '${t.select} ${t.characters}',
                    characters: widget.selectedScript!.characters
                        .where((character) => character.team != Team.traveller)
                        .toList(),
                    selectedCharacters: _selectedScriptCharacters,
                    numberOfCharactersToSelect: widget.numberOfPlayers.toInt(),
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
          if (widget.selectedScript != null) ...[
            CharactersManager(
              title: '${t.select} ${t.characters}',
              characters: widget.selectedScript!.characters
                  .where((character) => character.team != Team.traveller)
                  .toList(),
              selectedCharacters: _selectedScriptCharacters,
              numberOfCharactersToSelect: widget.numberOfPlayers.toInt(),
              gameSetup: gameSetup,
              allowMoreThanOneOfSameCharacter: true,
              saveCharacters: _updateScriptCharacters,
            ),
            const SizedBox(height: 8),
            bluffsWidget,
          ],
        ],
        if (_selectedScriptCharacters.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  t.addRemindersFirstNight,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Checkbox(
                value: _addRemindersFirstNight,
                onChanged: (bool? newValue) {
                  setState(() {
                    _addRemindersFirstNight = !_addRemindersFirstNight;
                  });
                },
              ),
            ],
          ),
          for (final badDisabledReminder in _bagDisabledReminders)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    '${t.add} ${badDisabledReminder.reminder.reminder}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Checkbox(
                  value: badDisabledReminder.addToGrimoire,
                  onChanged: (bool? newValue) {
                    setState(() {
                      badDisabledReminder.setAddToGrimoire = newValue ?? false;
                    });
                  },
                ),
              ],
            ),
        ],
        if (widget.selectedScript != null &&
            _selectedScriptCharacters.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            t.drawCharacters,
            style: theme.textTheme.titleMedium,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => _drawCharacters(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: theme.colorScheme.onSurface,
                  minimumSize: const Size(120, 40),
                ),
                icon: const ImageIcon(
                    AssetImage("assets/images/bag_outlined.png"),
                    size: 18),
                label: Text(t.grabFromBag),
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
                label: Text(t.pickNumber),
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
