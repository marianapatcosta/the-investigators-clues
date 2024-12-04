import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/scripts/character_item.dart';
import 'package:my_botc_notes/widgets/scripts/team_script_title.dart';

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
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        TeamScriptTitle(title: getCapitalizedTeamTitle(title)),
        const SizedBox(
          height: 8,
        ),
        for (final character in characters) CharacterItem(character: character)
      ],
    );
  }
}
