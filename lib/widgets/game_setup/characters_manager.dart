import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/scripts/character_token.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/widgets/game_setup/script_characters_selector.dart';

class CharactersManager extends StatelessWidget {
  const CharactersManager({
    super.key,
    required this.title,
    required this.numberOfCharactersToSelect,
    required this.characters,
    required this.selectedCharacters,
    this.gameSetup,
    required this.saveCharacters,
    this.allowMoreThanOneOfSameCharacter = false,
  });

  final String title;
  final int numberOfCharactersToSelect;
  final List<Character> characters;
  final List<Character> selectedCharacters;
  final GameSetup? gameSetup;
  final bool allowMoreThanOneOfSameCharacter;
  final Function(List<Character>) saveCharacters;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 3, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            child: TextButton(
              onPressed: () {
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
                  builder: (ctx) => ScriptCharactersSelector(
                    title: title,
                    characters: characters
                        .where((character) =>
                            character.team != Team.traveller &&
                            character.team != Team.fabled)
                        .toList(),
                    initialSelectedCharacters: selectedCharacters,
                    numberOfCharactersToSelect: numberOfCharactersToSelect,
                    gameSetup: gameSetup,
                    allowMoreThanOneOfSameCharacter:
                        allowMoreThanOneOfSameCharacter,
                    saveCharacters: saveCharacters,
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child:
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: selectedCharacters.isEmpty
              ? Text(t.noCharactersSelected)
              : Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    for (final character in selectedCharacters)
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FittedBox(
                          child: CharacterToken(
                            character: character,
                          ),
                        ),
                      )
                  ],
                ),
        )
      ],
    );
  }
}
