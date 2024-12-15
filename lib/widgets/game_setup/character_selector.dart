import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterToken, ModalContentWrapper, ShowMoreButton;

class CharacterSelector extends StatefulWidget {
  const CharacterSelector({
    super.key,
    required this.characters,
    this.availableCharacters,
    this.showUnknownCharacter = false,
    required this.onSelectCharacter,
  });

  final List<Character> characters;
  final List<Character>? availableCharacters;
  final bool showUnknownCharacter;
  final void Function(Character?) onSelectCharacter;

  @override
  State<CharacterSelector> createState() {
    return _CharacterSelectorState();
  }
}

class _CharacterSelectorState extends State<CharacterSelector> {
  bool _showAllCharacters = false;

  List<Character> get characters {
    if (widget.availableCharacters == null) {
      return widget.characters;
    }

    if (_showAllCharacters) {
      return widget.characters;
    }

    return widget.availableCharacters!;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    inspect(characters);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: ModalContentWrapper(
          title: t.selectCharacter,
          content: Wrap(
            runSpacing: 6,
            spacing: 6,
            children: [
              for (final character in characters)
                Semantics(
                  button: true,
                  label: '${t.select} ${character.name}',
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      widget.onSelectCharacter(character);
                    },
                    child: CharacterToken(
                      character: character,
                    ),
                  ),
                ),
              if (widget.showUnknownCharacter)
                Semantics(
                  button: true,
                  label: '${t.unselect} ',
                  child: InkWell(
                    onTap: () {
                      widget.onSelectCharacter(null);
                    },
                    child: const CharacterToken(
                      character: null,
                    ),
                  ),
                ),
              if (widget.availableCharacters != null)
                ShowMoreButton(
                    size: kCharacterTokenSizeSmall,
                    showMore: !_showAllCharacters,
                    toggleShowMore: () {
                      setState(() {
                        _showAllCharacters = !_showAllCharacters;
                      });
                    })
            ],
          )),
    );
  }
}
