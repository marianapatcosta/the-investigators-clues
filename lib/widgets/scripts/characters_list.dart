import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/scripts/character_item.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    super.key,
    required this.characters,
    required this.title,
  });

  final List<Character> characters;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Transform.translate(
          offset: const Offset(-8, 0),
          //    child: IntrinsicHeight(
          child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*  Container(
                color: theme.colorScheme.primary,
                child:  */
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  getCapitalizedTeamTitle(title),
                  style: theme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              //  ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  children: [
                    for (final character in characters)
                      CharacterItem(character: character)
                  ],
                ),
              ),
            ],
            // ),
          ),
        ),

        /* const SizedBox(
          height: 8,
        ),
        TeamScriptTitle(title: getCapitalizedTeamTitle(title)),
        for (final character in characters) CharacterItem(character: character) */
      ],
    );
  }
}
