import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/jinx.dart';
import 'package:my_botc_notes/utils.dart';

enum Team {
  townsfolk,
  outsider,
  minion,
  demon,
  traveller,
  fabled;
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.team,
    required this.ability,
    this.edition,
    this.setup = false,
    this.bagDisabled = false,
    this.characterInfoUrl,
    this.firstNight,
    this.otherNight,
    this.firstNightReminder,
    this.otherNightReminder,
    this.firstNightReminders,
    this.reminders,
    this.remindersFirstNight,
    this.remindersGlobal,
  }) : image = '$kCharactersTokensPath/$id.$kCharactersTokensFileFormat';

  final String id;
  final String name;
  final Team team;
  final String ability;
  final String image;
  final String? edition;
  final bool? setup;
  final bool bagDisabled;
  final int? firstNight;
  final int? otherNight;
  final String? firstNightReminder;
  final String? otherNightReminder;
  final List<String>? firstNightReminders;
  final List<String>? reminders;
  final List<String>? remindersFirstNight;
  final List<String>? remindersGlobal;
  final String? characterInfoUrl;

  Jinx? _jinxes;

  String? get setupWarning {
    if (setup == null || !setup!) {
      return null;
    }
    String setupWarning = '';
    if (bagDisabled) {
      setupWarning = '$setupWarning $name must not be added to the bag.\n';
    }

    if (ability.split('[').length > 1) {
      setupWarning = '$setupWarning ${ability.split('[')[1].split(']')[0]}.';
    }

    return setupWarning;
  }

  Jinx? get jinxes {
    return _jinxes;
  }

  set setJinxes(Jinx? characterJinxes) {
    _jinxes = characterJinxes;
  }

  Character.fromJson(
    Map<String, dynamic> json, {
    characterInfoUrl,
  })  : id = json['id'] as String,
        name = json['name'] as String,
        team = getTeamFromString(json['team'] as String),
        ability = json['ability'] as String,
        image = json['image'] ?? '$kCharactersTokensPath/${json['id']}.png',
        edition = json['edition'] as String?,
        setup = json['setup'] as bool?,
        bagDisabled =
            json['bagDisabled'] != null ? json['bagDisabled'] as bool : false,
        firstNight = json['firstNight'],
        otherNight = json['otherNight'],
        firstNightReminder = json['firstNightReminder'] as String?,
        otherNightReminder = json['otherNightReminder'] as String?,
        firstNightReminders = json['firstNightReminders'] == null
            ? null
            : List.from(json['reminders'] as List),
        reminders = json['reminders'] == null
            ? null
            : List.from(json['reminders'] as List),
        remindersFirstNight = json['remindersFirstNight'] == null
            ? null
            : List.from(json['remindersFirstNight'] as List),
        remindersGlobal = json['remindersGlobal'] == null
            ? null
            : List.from(json['remindersGlobal'] as List),
        characterInfoUrl = characterInfoUrl as String?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'team': team.name,
      'ability': ability,
      'image': image,
      'edition': edition,
      'setup': setup,
      'bagDisabled': bagDisabled,
      'firstNight': firstNight,
      'otherNight': otherNight,
      'firstNightReminder': firstNightReminder,
      'otherNightReminder': otherNightReminder,
      'firstNightReminders': firstNightReminders,
      'reminders': reminders,
      'remindersFirstNight': remindersFirstNight,
      'remindersGlobal': remindersGlobal,
      'characterInfoUrl': characterInfoUrl,
    };
  }
}
