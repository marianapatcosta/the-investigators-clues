import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/character_item.dart';
import 'package:my_botc_notes/widgets/team_script_title.dart';

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    super.key,
    required this.characters,
    required this.title,
  });

  final List<Character> characters;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeamScriptTitle(title: getCapitalizedTeamTitle(title)),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: 3,
          ),
          children: [
            for (final character in characters)
              CharacterItem(character: character, small: true)
          ],
        ),
      ],
    );
  }
}
