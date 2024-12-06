import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/night_order.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/models/screen_metadata.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/widgets/game_setup/character_selector.dart';
import 'package:my_botc_notes/widgets/grimoire/reminder_selector.dart';

String getCapitalizedTeamTitle(String title) {
  return '${title[0].toUpperCase()}${title.substring(1)}${title.toLowerCase() == 'fabled' || title.toLowerCase() == 'townsfolk' ? '' : 's'}';
}

Map<Team, List<Character>> getCharactersByTeam(List<Character> characters) {
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
    Team.townsfolk: townsfolk,
    Team.outsider: outsiders,
    Team.minion: minions,
    Team.demon: demons,
    Team.traveller: travellers,
    Team.fabled: fabled
  };
}

String getLabelFromTeam(Team team) {
  if (team == Team.townsfolk) {
    return 'Townsfolk';
  }
  if (team == Team.outsider) {
    return 'Outsiders';
  }
  if (team == Team.minion) {
    return 'Minions';
  }
  if (team == Team.demon) {
    return 'Demon';
  }
  if (team == Team.traveller) {
    return 'Travellers';
  }
  if (team == Team.fabled) {
    return 'Fabled';
  }

  return '';
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
    'storyteller': t.storyteller,
    'day': t.day,
    'night': t.night,
    "infoToken1Label": t.infoToken1Label,
    "infoToken1RegularPart1": t.infoToken1RegularPart1,
    "infoToken1Bold": t.infoToken1Bold,
    "infoToken1RegularPart2": t.infoToken1RegularPart2,
    "infoToken2Label": t.infoToken2Label,
    "infoToken2RegularPart1": t.infoToken2RegularPart1,
    "infoToken2Bold": t.infoToken2Bold,
    "infoToken2RegularPart2": t.infoToken2RegularPart2,
    "infoToken3Label": t.infoToken3Label,
    "infoToken3RegularPart1": t.infoToken3RegularPart1,
    "infoToken3Bold": t.infoToken3Bold,
    "infoToken3RegularPart2": t.infoToken3RegularPart2,
    "infoToken4Label": t.infoToken4Label,
    "infoToken4RegularPart1": t.infoToken4RegularPart1,
    "infoToken4Bold": t.infoToken4Bold,
    "infoToken4RegularPart2": t.infoToken4RegularPart2,
    "infoToken5Label": t.infoToken5Label,
    "infoToken5RegularPart1": t.infoToken5RegularPart1,
    "infoToken5Bold": t.infoToken5Bold,
    "infoToken5RegularPart2": t.infoToken5RegularPart2,
    "infoToken6Label": t.infoToken6Label,
    "infoToken6RegularPart1": t.infoToken6RegularPart1,
    "infoToken6Bold": t.infoToken6Bold,
    "infoToken6RegularPart2": t.infoToken6RegularPart2,
    "infoToken7Label": t.infoToken7Label,
    "infoToken7RegularPart1": t.infoToken7RegularPart1,
    "infoToken7Bold": t.infoToken7Bold,
    "infoToken7RegularPart2": t.infoToken7RegularPart2,
    "infoToken8Label": t.infoToken8Label,
    "infoToken8RegularPart1": t.infoToken8RegularPart1,
    "infoToken8Bold": t.infoToken8Bold,
    "infoToken8RegularPart2": t.infoToken8RegularPart2,
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

void selectToken(
    BuildContext context, Widget Function(BuildContext ctx) getSelectorWidget) {
  final width = MediaQuery.of(context).size.width;

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
    builder: (ctx) => getSelectorWidget(ctx),
  );
}

void selectCharacter(BuildContext context, List<Character> characters,
    void Function(Character? character) select,
    [bool showUnknownCharacter = false, List<Character>? availableCharacters]) {
  selectToken(
    context,
    (ctx) => CharacterSelector(
        characters: characters,
        availableCharacters: availableCharacters,
        showUnknownCharacter: showUnknownCharacter,
        onSelectCharacter: (character) {
          Navigator.pop(ctx);
          select(character);
        }),
  );
}

void selectReminder(
    BuildContext context,
    List<Reminder> inPlayCharactersReminders,
    List<Reminder> otherReminders,
    List<Character> sessionCharacters,
    void Function(Reminder reminder) select) {
  selectToken(
      context,
      (ctx) => ReminderSelector(
          inPlayCharactersReminders: inPlayCharactersReminders,
          otherReminders: otherReminders,
          sessionCharacters: sessionCharacters,
          onSelectReminder: (reminder) {
            Navigator.pop(ctx);
            select(reminder);
          }));
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

List<String> getOrderIds(List<Character> characters) {
  return characters.map((character) => character.id).toList()
    ..addAll(defaultOrders);
}

List<dynamic> getFirstNightOrder(
    List<Character> characters, bool hasHomebrewCharacters) {
  if (hasHomebrewCharacters) {
    return characters.where((character) => character.firstNight != 0).toList()
      ..sort((characterA, characterB) =>
          characterA.firstNight!.compareTo(characterB.firstNight!));
  }
  final orderIds = getOrderIds(characters);
  return nightOrder['firstNight']!
      .where((item) => orderIds.contains(item))
      .toList();
}

List<dynamic> getOtherNightsOrder(
    List<Character> characters, bool hasHomebrewCharacters) {
  if (hasHomebrewCharacters) {
    return characters.where((character) => character.otherNight != 0).toList()
      ..sort((characterA, characterB) =>
          characterA.otherNight!.compareTo(characterB.otherNight!));
  }

  final orderIds = getOrderIds(characters);
  return nightOrder['otherNight']!
      .where((item) => orderIds.contains(item))
      .toList();
}
