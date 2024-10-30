import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/character_token.dart';
import 'package:my_botc_notes/widgets/form_action_bar.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/widgets/switcher.dart';

class EditPlayer extends StatefulWidget {
  const EditPlayer({
    super.key,
    required this.player,
    required this.scriptCharacters,
    required this.removePlayer,
  });

  final Player player;
  final List<Character> scriptCharacters;
  final void Function() removePlayer;

  Character? get character {
    if (player.characterId == null) {
      return null;
    }
    return scriptCharacters
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

  void _onSave(BuildContext context) {
    Navigator.of(context).pop(
      Player(
        name: _nameController.text,
        notes: _notesController.text,
        isDead: _isDead,
        hasGhostVote: _hasGhostVote,
        characterId: _character?.id,
        isEvilEasterEgg: _isEvilEasterEgg,
      ),
    );
  }

  void _onDeletePlayer() {
    final t = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          t.deletePlayer(
              widget.player.name != '' ? widget.player.name : t.player),
          style: const TextStyle(fontFamily: 'Dumbledore'),
        ),
        content: Text(t.deletePlayerAreYouSure),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () {
              widget.removePlayer();
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            child: Text(t.yes),
          )
        ],
      ),
    );
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
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    final displayName =
        widget.player.name != '' ? widget.player.name : t.player;

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Column(
                children: [
                  Wrap(children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Hero(
                      tag: widget.player.id,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Semantics(
                          button: true,
                          label: t.selectCharacter,
                          child: InkWell(
                            onTap: () => selectCharacter(
                                context,
                                widget.character?.team == Team.traveller
                                    ? characters
                                        .where((character) =>
                                            character.team == Team.traveller)
                                        .toList()
                                    : widget.scriptCharacters
                                        .where((character) =>
                                            character.team != Team.traveller)
                                        .toList(), (character) {
                              setState(() {
                                _character = character;
                              });
                            }),
                            onLongPress: () {
                              setState(() {
                                _isEvilEasterEgg = !_isEvilEasterEgg;
                              });
                            },
                            child: CharacterToken(
                                character: _character,
                                isLarge: true,
                                isEvilEasterEgg: _isEvilEasterEgg),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Transform.translate(
                        offset: const Offset(0, -12),
                        child: IconButton(
                          onPressed: _onDeletePlayer,
                          icon: Icon(
                            Icons.delete,
                            semanticLabel: t.deleteGame,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 32,
                  ),
                  if (!isLargeScreen)
                    TextField(
                      controller: _nameController,
                      maxLength: 20,
                      decoration: InputDecoration(label: Text(t.nameOfPlayer)),
                    ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isLargeScreen)
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            maxLength: 20,
                            decoration:
                                InputDecoration(label: Text(t.nameOfPlayer)),
                          ),
                        ),
                      if (isScreenBiggerThanX(width, ScreenSize.md))
                        const SizedBox(
                          width: 32,
                        ),
                      Switcher(
                        title: t.shroud,
                        value: _isDead,
                        onChange: (isChecked) {
                          setState(() {
                            _isDead = !_isDead;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Switcher(
                        title: t.ghostVote,
                        value: _hasGhostVote,
                        onChange: !_isDead
                            ? null
                            : (isChecked) {
                                setState(() {
                                  _hasGhostVote != _hasGhostVote;
                                });
                              },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _notesController,
                    maxLength: 250,
                    decoration: InputDecoration(label: Text(t.notes)),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 48),
                  FormActionBar(onSave: () => _onSave(context))
                ],
              ),
            )),
      ),
    );
  }
}
