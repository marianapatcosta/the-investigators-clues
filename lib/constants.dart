import 'package:flutter/material.dart';
import 'package:my_botc_notes/data/scripts.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/screen_metadata.dart';
import 'package:my_botc_notes/screens/about.dart';
import 'package:my_botc_notes/screens/acknowledgments.dart';
import 'package:my_botc_notes/screens/characters_list.dart';
import 'package:my_botc_notes/screens/game.dart';
import 'package:my_botc_notes/screens/more.dart';
import 'package:my_botc_notes/screens/rules.dart';
import 'package:my_botc_notes/screens/scripts_list.dart';
import 'package:my_botc_notes/screens/settings.dart';
import 'package:my_botc_notes/utils.dart';

enum ScreenSize { sm, md, l, xl }

const kBreakpoints = {
  ScreenSize.sm: 480.0,
  ScreenSize.md: 768.0,
  ScreenSize.l: 992.0,
  ScreenSize.xl: 1200.0,
};

final screensMetadata = [
  ScreenMetadata(
    titleKey: 'game',
    icon: Icons.note_alt,
    screen: GameScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'scripts',
    icon: Icons.my_library_books,
    screen: ScriptsListScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'characters',
    icon: Icons.groups,
    screen: CharactersListScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'rules',
    icon: Icons.rule,
    screen: RulesScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'about',
    icon: Icons.info_outlined,
    screen: AboutScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'settings',
    icon: Icons.settings,
    screen: SettingsScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'acknowledgments',
    icon: Icons.handshake_outlined,
    screen: AcknowledgmentsScreen(),
  ),
];

const moreScreenMetadata = ScreenMetadata(
  titleKey: 'more',
  icon: Icons.more_horiz,
  screen: MoreScreen(),
);

final teamsColors = {
  Team.townsfolk: Colors.blue.shade800,
  Team.outsider: Colors.blue.shade500,
  Team.minion: Colors.orange.shade800,
  Team.demon: Colors.red.shade600,
  Team.traveller: [Colors.blue.shade800, Colors.red.shade600],
  Team.fabled: Colors.yellow.shade700,
};

const kMobileTabsNumber = 5;

const botcWikiUrl = 'https://wiki.bloodontheclocktower.com';

const kScriptsDatabaseUrl = 'botc-scripts.azurewebsites.net';

const kCharactersTokensPath = 'assets/images/character_tokens';
const kCharactersTokensFileType = 'webp';

final kInitialFavoriteScripts = mapInfoToScripts(favoriteScriptsInfo);

const kCharacterTokenSmallSize = 70.0;
const kCharacterTokenLargeSize = 100.0;
