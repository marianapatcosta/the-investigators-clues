import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character, Script;
import 'package:my_botc_notes/screens/index.dart' show CharacterDetailsScreen;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharactersGrid, CharacterItem, Jinxes, NightOrder, TeamScriptTitle;

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
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

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
            for (final item in charactersByTeam.entries)
              Column(
                children: [
                  ExpansionTile(
                      initiallyExpanded: true,
                      shape: const Border(),
                      tilePadding: EdgeInsets.zero,
                      title: TeamScriptTitle(title: item.key),
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        if (isLargeScreen)
                          CharactersGrid(characters: item.value)
                        else
                          for (final character in item.value) ...[
                            CharacterItem(character: character),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        const SizedBox(
                          height: 16,
                        ),
                      ])
                ],
              ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                t.eachNightExcept,
              ),
            ),
            const SizedBox(
              height: 12,
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
