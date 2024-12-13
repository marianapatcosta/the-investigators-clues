import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart'
    show Character, Player, Reminder;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show EditPlayerHeader, FormActionBar, Layout, ReminderToken;

class EditPlayer extends StatefulWidget {
  const EditPlayer({
    super.key,
    required this.player,
    required this.sessionCharacters,
    required this.sessionReminders,
    required this.removePlayer,
    required this.isStorytellerMode,
    required this.inPlayCharactersIds,
  });

  final Player player;
  final List<Character> sessionCharacters;
  final List<Reminder> sessionReminders;
  final bool isStorytellerMode;
  final List<String> inPlayCharactersIds;
  final void Function() removePlayer;

  Character? get character {
    if (player.characterId == null) {
      return null;
    }
    return sessionCharacters
        .firstWhere((character) => character.id == player.characterId);
  }

  @override
  State<EditPlayer> createState() {
    return _EditPlayerState();
  }
}

class _EditPlayerState extends State<EditPlayer> {
  late final TextEditingController _nameController;
  late final TextEditingController _notesController;
  late bool _isDead;
  late bool _hasGhostVote;
  late Character? _character;
  late bool _isEvilEasterEgg = false;
  late List<Reminder> _reminders;

  void _onSave(BuildContext context) {
    Navigator.of(context).pop(
      Player(
        name: _nameController.text,
        notes: _notesController.text,
        isDead: _isDead,
        hasGhostVote: _hasGhostVote,
        characterId: _character?.id,
        isEvilEasterEgg: _isEvilEasterEgg,
        reminders: _reminders,
      ),
    );
  }

  void _onAddReminder() {
    final List<Reminder> inPlayCharactersReminders = [...kGeneralReminders];
    final List<Reminder> otherReminders = [];

    for (final reminder in widget.sessionReminders) {
      if (widget.inPlayCharactersIds.contains(reminder.tokenId)) {
        inPlayCharactersReminders.add(reminder);
      } else {
        otherReminders.add(reminder);
      }
    }

    selectReminder(context, inPlayCharactersReminders, otherReminders,
        widget.sessionCharacters, (reminder) {
      final playerX = widget.player.x!;
      final playerY = widget.player.y!;
      final width = MediaQuery.of(context).size.width;
      final isPlayerOnRightSide = playerX > width / 2;

      final reminderOffsetX = isPlayerOnRightSide
          ? playerX + kReminderTokenSizeSmall / 2
          : playerX + kCharacterTokenSizeSmall;

      final reminderOffsetY = playerY -
          kCharacterTokenSizeSmall * 0.5 +
          (_reminders.length) * kCharacterTokenSizeSmall * 0.5;

      reminder.setX = reminderOffsetX;
      reminder.setY = reminderOffsetY;

      setState(() {
        _reminders.add(reminder);
      });
    });
  }

  Character? _getCharacter(String tokenId) {
    if (kGeneralReminders
        .where((reminder) => reminder.tokenId == tokenId)
        .isNotEmpty) {
      return null;
    }

    return charactersMap[tokenId] ??
        widget.sessionCharacters
            .firstWhere((character) => character.id == tokenId);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.player.name);
    _notesController = TextEditingController(text: widget.player.notes);
    _isDead = widget.player.isDead;
    _hasGhostVote = widget.player.hasGhostVote;
    _character = widget.character;
    _isEvilEasterEgg = widget.player.isEvilEasterEgg;
    _reminders =
        widget.player.reminders != null ? [...widget.player.reminders!] : [];
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    final displayName =
        widget.player.name != '' ? widget.player.name : t.player;

    final remindersWidget = widget.isStorytellerMode
        ? Column(
            children: [
              Row(
                children: [
                  Text(
                    t.reminders,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: _onAddReminder,
                      icon: Icon(Icons.add,
                          semanticLabel: t.addReminder,
                          color: theme.colorScheme.primary)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: _reminders.isEmpty
                    ? Text(t.noReminders)
                    : Wrap(
                        runSpacing: 6,
                        spacing: 6,
                        alignment: WrapAlignment.start,
                        children: [
                          for (final reminder in _reminders)
                            Wrap(children: [
                              SizedBox(
                                width: kReminderTokenSizeSmall * 1.2,
                                child: Stack(
                                  children: [
                                    ReminderToken(
                                      reminder: reminder,
                                      character:
                                          _getCharacter(reminder.tokenId),
                                    ),
                                    Positioned(
                                        right: -17,
                                        top: -15,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _reminders.remove(reminder);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            semanticLabel: t.deleteGame,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ])
                        ],
                      ),
              ),
            ],
          )
        : const SizedBox();

    return Layout(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
        title: Text('${t.edit} $displayName'),
        centerTitle: false,
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 36,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              EditPlayerHeader(
                  playerId: widget.player.id,
                  playerName: widget.player.name,
                  isDead: _isDead,
                  character: _character,
                  hasGhostVote: _hasGhostVote,
                  isEvilEasterEgg: _isEvilEasterEgg,
                  isStorytellerMode: widget.isStorytellerMode,
                  sessionCharacters: widget.sessionCharacters,
                  removePlayer: widget.removePlayer,
                  toggleIsEvilEasterEgg: () {
                    setState(() {
                      if (!_isEvilEasterEgg && _character != null) {
                        _character = null;
                      }
                      _isEvilEasterEgg = !_isEvilEasterEgg;
                    });
                  },
                  selectPlayerCharacter: (character) {
                    setState(() {
                      _character = character;
                    });
                  }),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      maxLength: 20,
                      decoration: InputDecoration(label: Text(t.nameOfPlayer)),
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.shroud,
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Checkbox(
                              value: _isDead,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _isDead = newValue ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Opacity(
                              opacity: _isDead ? 1 : 0.75,
                              child: Text(
                                t.ghostVote,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Checkbox(
                              value: _hasGhostVote,
                              onChanged: !_isDead
                                  ? null
                                  : (bool? newValue) {
                                      setState(() {
                                        _hasGhostVote = newValue ?? false;
                                      });
                                    },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              if (!isLargeScreen) ...[
                TextField(
                  controller: _notesController,
                  maxLength: 250,
                  decoration: InputDecoration(label: Text(t.notes)),
                  maxLines: 3,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 28,
                )
              ],
              if (!isLargeScreen) remindersWidget,
              if (isLargeScreen)
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _notesController,
                        maxLength: 250,
                        decoration: InputDecoration(label: Text(t.notes)),
                        maxLines: 3,
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(child: remindersWidget)
                  ],
                ),
              const SizedBox(height: 48),
              FormActionBar(onSave: () => _onSave(context))
            ],
          ),
        ),
      ),
    ));
  }
}
