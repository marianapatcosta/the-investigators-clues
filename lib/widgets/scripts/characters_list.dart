import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterItem, TeamScriptTitle;

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
        ExpansionTile(
            initiallyExpanded: true,
            shape: const Border(),
            tilePadding: EdgeInsets.zero,
            title: TeamScriptTitle(title: title),
            children: [
              const SizedBox(
                height: 8,
              ),
              for (final character in characters)
                CharacterItem(character: character)
            ])
      ],
    );
  }
}
