import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/screen_metadata.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/widgets/character_selector.dart';

String getCapitalizedTeamTitle(String title) {
  return '${title[0].toUpperCase()}${title.substring(1)}${title.toLowerCase() == 'fabled' || title.toLowerCase() == 'townsfolk' ? '' : 's'}';
}

Map<String, List<Character>> getCharactersByTeam(List<Character> characters) {
  final List<Character> townsfolk = [];
  final List<Character> outsiders = [];
  final List<Character> minions = [];
  final List<Character> demons = [];
  final List<Character> travellers = [];
  final List<Character> fabled = [];

  for (final character in characters) {
    if (character.team == Team.townsfolk) {
      townsfolk.add(character);
    }
    if (character.team == Team.outsider) {
      outsiders.add(character);
    }
    if (character.team == Team.minion) {
      minions.add(character);
    }
    if (character.team == Team.demon) {
      demons.add(character);
    }
    if (character.team == Team.traveller) {
      travellers.add(character);
    }
    if (character.team == Team.fabled) {
      fabled.add(character);
    }
  }
  return {
    'Townsfolk': townsfolk,
    'Outsiders': outsiders,
    'Minions': minions,
    'Demons': demons,
    'Travellers': travellers,
    'Fabled': fabled
  };
}

List<Script> mapInfoToScripts(List<Map<String, dynamic>> scriptsInfo) {
  return scriptsInfo
      .map(
        (script) => Script(
          id: script['pk'] as int,
          name: script['name'] as String,
          author: script['author'] as String,
          version:
              script['version'] != null ? script['version'] as String : null,
          score: script['score'] != null ? script['score'] as int : null,
          content: script['content'] as List,
          almanacUrl:
              script['almanac'] != null ? script['almanac'] as String : null,
        ),
      )
      .toList();
}

bool isScreenSmallerThanX(double width, ScreenSize screenSize) {
  return width < kBreakpoints[screenSize]!;
}

bool isScreenBiggerThanX(double width, ScreenSize screenSize) {
  return width > kBreakpoints[screenSize]!;
}

Function(String) getTranslationKeyGetter(BuildContext context) {
  final t = AppLocalizations.of(context);
  final translationsMap = {
    'scripts': t.scripts,
    'script': t.script,
    'characters': t.characters,
    'game': t.game,
    'rules': t.rules,
    'more': t.more,
    'about': t.about,
    'settings': t.settings,
    'acknowledgments': t.acknowledgments,
    'dark': t.darkTheme,
    'light': t.lightTheme,
    'system': t.systemTheme,
    'setup': t.setup,
  };
  return (String key) => translationsMap[key];
}

List<ScreenMetadata> getTabsMetadata(double screenWidth) {
  if (isScreenSmallerThanX(screenWidth, ScreenSize.md)) {
    return screensMetadata.take(kMobileTabsNumber - 1).toList()
      ..add(moreScreenMetadata);
  }

  return screensMetadata;
}

List<ScreenMetadata> getMoreScreensMetadata(double screenWidth) {
  if (isScreenSmallerThanX(screenWidth, ScreenSize.md)) {
    return screensMetadata.sublist(kMobileTabsNumber - 1);
  }

  return screensMetadata;
}

Team getTeamFromString(String team) {
  return team == 'traveler' ? Team.traveller : Team.values.byName(team);
}

void selectCharacter(BuildContext context, List<Character> characters,
    void Function(Character character) select) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: const BoxConstraints(
      maxWidth: double.infinity,
    ),
    builder: (ctx) => CharacterSelector(
        characters: characters,
        onSelectCharacter: (character) {
          select(character);
          Navigator.pop(ctx);
        }),
  );
}

void showDeleteGameDialog(
    BuildContext context, String content, void Function() onDelete) {
  final t = AppLocalizations.of(context);
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        t.deleteGame,
        style: const TextStyle(fontFamily: 'Dumbledore'),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: Text(t.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            onDelete();
          },
          child: Text(t.yes),
        )
      ],
    ),
  );
}
