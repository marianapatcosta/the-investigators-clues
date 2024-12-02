import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/screens/character_details.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/characters_grid.dart';
import 'package:my_botc_notes/widgets/characters_list.dart';
import 'package:my_botc_notes/widgets/jinxes.dart';
import 'package:my_botc_notes/widgets/night_order.dart';

class ScriptDetailsContent extends StatelessWidget {
  const ScriptDetailsContent({
    super.key,
    required this.script,
    this.sessionCharacters,
  });

  final Script script;
  final List<Character>? sessionCharacters;

  List<Character> get characters {
    if (sessionCharacters != null) {
      return sessionCharacters!;
    }

    return script.characters;
  }

  Map<String, List<Character>> get charactersByTeam {
    final Map<String, List<Character>> currentMap = {};

    for (final character in characters) {
      final team = character.team.name;
      if (!currentMap.containsKey(team)) {
        currentMap[team] = [];
      }

      final characterJinxes =
          script.jinxes.where((jinx) => jinx.id == character.id).toList();
      if (characterJinxes.isNotEmpty) {
        character.setJinxes = characterJinxes[0];
      }

      currentMap[team]?.add(character);
    }
    return currentMap;
  }

  void seeCharacterDetails(BuildContext context, Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => CharacterDetailsScreen(
          character: character,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    List<Widget> content = [
      for (final item in charactersByTeam.entries)
        CharactersList(characters: item.value, title: item.key)
    ];

    if (width > 700) {
      content = [
        const SizedBox(
          height: 8,
        ),
        for (final item in charactersByTeam.entries)
          CharactersGrid(characters: item.value, title: item.key),
      ];
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 16,
        ),
        child: Column(
          children: [
            ...content,
            const SizedBox(
              height: 8,
            ),
            if (isScreenBiggerThanX(width, ScreenSize.md))
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (script.jinxes.isNotEmpty)
                    Expanded(
                      child: Jinxes(
                        jinxes: script.jinxes,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: NightOrder(
                        characters: characters,
                        hasHomebrewCharacters: script.hasHomebrewCharacters,
                      ),
                    ),
                  ),
                  if (script.jinxes.isEmpty) const Spacer()
                ],
              )
            else ...[
              if (script.jinxes.isNotEmpty)
                Column(
                  children: [
                    Jinxes(
                      jinxes: script.jinxes,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: NightOrder(
                  characters: characters,
                  hasHomebrewCharacters: script.hasHomebrewCharacters,
                ),
              ),
            ],
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
