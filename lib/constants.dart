import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:my_botc_notes/data/scripts.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/info_token.dart';
import 'package:my_botc_notes/models/reminder.dart';
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

const uuid = Uuid();

enum ScreenSize { xs, sm, md, l, xl }

enum TokenSize { small, medium, large }

enum NightType { first, other }

const List<String> defaultOrders = ["DUSK", "DAWN", "MINION", "DEMON"];

const kBreakpoints = {
  ScreenSize.xs: 414.0,
  ScreenSize.sm: 480.0,
  ScreenSize.md: 768.0,
  ScreenSize.l: 992.0,
  ScreenSize.xl: 1200.0,
};

final screensMetadata = [
  const ScreenMetadata(
    titleKey: 'game',
    image: AssetImage("assets/images/game.png"),
    screen: GameScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'scripts',
    image: AssetImage("assets/images/script.png"),
    screen: ScriptsListScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'characters',
    image: AssetImage("assets/images/people.png"),
    screen: CharactersListScreen(),
  ),
  const ScreenMetadata(
    titleKey: 'rules',
    image: AssetImage("assets/images/rules.png"),
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

const double kMinNumberPlayers = 5.0;
const double kMaxNumberPlayers = 15.0;
const int kDemonBluffsNumber = 3;

const kMobileTabsNumber = 5;

const double kTabsAppBarHeight = 75;

const botcWikiUrl = 'https://wiki.bloodontheclocktower.com';

const kScriptsDatabaseUrl = 'botc-scripts.azurewebsites.net';

const kCharactersTokensPath = 'assets/images/character_tokens';

final kInitialFavoriteScripts = mapInfoToScripts(favoriteScriptsInfo);

const kCharacterTokenSizeSmall = 70.0;
const kCharacterTokenSizeMedium = 100.0;
const kCharacterTokenSizeLarge = 150.0;
const kPlayerNotesSize = 60.0;
const kPlayerCheckboxesSize = 36.0;

const kReminderTokenSizeSmall = 60.0;
const kReminderTokenSizeMedium = 100.0;
const kReminderTokenSizeLarge = 150.0;

const kGhostVoteTokenSizeSmall = 35.0;
const kGhostVoteTokenSizeMedium = 50.0;

const kInfoCardWidth = 200.0;
const kInfoCardHeight = 340.0;

const kPocketGrimoireUrl = 'https://www.pocketgrimoire.co.uk';

final kGeneralReminders = [
  Reminder(characterId: 'good', reminder: 'Good'),
  Reminder(characterId: 'evil', reminder: 'Evil'),
];

const List<double> greyMatrix = [
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
];

final infoTokens = [
  InfoToken(
    id: 'this-is-demon',
    label: 'infoToken1Label',
    regularPart1: 'infoToken1RegularPart1',
    bold: 'infoToken1Bold',
    regularPart2: 'infoToken1RegularPart2',
    imageName: "stain",
    color: const Color.fromARGB(255, 151, 88, 107),
  ),
  InfoToken(
    id: 'these-are-minions',
    label: 'infoToken2Label',
    regularPart1: 'infoToken2RegularPart1',
    bold: 'infoToken2Bold',
    regularPart2: 'infoToken2RegularPart2',
    imageName: "minions",
    color: const Color.fromARGB(255, 151, 88, 107),
  ),
  InfoToken(
    id: 'bluffs',
    label: 'infoToken3Label',
    regularPart1: 'infoToken3RegularPart1',
    bold: 'infoToken3Bold',
    regularPart2: 'infoToken3RegularPart2',
    imageName: "eyes",
    color: const Color.fromRGBO(71, 138, 193, 1),
    tokenSlots: [null, null, null],
  ),
  InfoToken(
    id: 'character-selected-you',
    label: 'infoToken4Label',
    regularPart1: 'infoToken4RegularPart1',
    bold: 'infoToken4Bold',
    regularPart2: 'infoToken4RegularPart2',
    imageName: "claw",
    color: const Color.fromRGBO(37, 62, 49, 1),
    tokenSlots: [null, null, null],
  ),
  InfoToken(
    id: 'player-is',
    label: 'infoToken5Label',
    regularPart1: 'infoToken5RegularPart1',
    bold: 'infoToken5Bold',
    regularPart2: 'infoToken5RegularPart2',
    imageName: "eye",
    tokenSlots: [null, null],
  ),
  InfoToken(
    id: 'you-are',
    label: 'infoToken6Label',
    regularPart1: 'infoToken6RegularPart1',
    bold: 'infoToken6Bold',
    regularPart2: 'infoToken6RegularPart2',
    imageName: "hand",
    tokenSlots: [null],
  ),
  InfoToken(
    id: 'nominated',
    label: 'infoToken7Label',
    regularPart1: 'infoToken7RegularPart1',
    bold: 'infoToken7Bold',
    regularPart2: 'infoToken7RegularPart2',
    imageName: 'bell',
    color: const Color.fromRGBO(222, 151, 113, 1),
  ),
  InfoToken(
    id: 'voted',
    label: 'infoToken8Label',
    regularPart1: 'infoToken8RegularPart1',
    bold: 'infoToken8Bold',
    regularPart2: 'infoToken8RegularPart2',
    imageName: 'flowers',
    color: const Color.fromRGBO(216, 137, 95, 1),
  )
];

const kXmasImages = [
  'candy-cane',
  'christmas-bell',
  'christmas-tree',
  'christmas-wreath',
  'hat',
  'reindeer',
  'balls',
  'bauble',
  'gingerbread-man',
  'letter',
  'mistletoe',
  'sleigh',
  'snowman',
  'christmas-sock',
  'presents',
  'snowflake',
  'christmas-sweater',
  'gift-box',
  'santa-claus'
];
