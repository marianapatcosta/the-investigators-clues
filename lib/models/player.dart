import 'package:my_botc_notes/models/reminder.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Player {
  Player({
    this.name = '',
    this.notes = '',
    this.isDead = false,
    this.hasGhostVote = true,
    this.characterId,
    this.isEvilEasterEgg = false,
    this.x,
    this.y,
    this.reminders,
  }) : id = uuid.v4();

  String id;
  String name;
  String notes;
  bool isDead;
  bool hasGhostVote;
  String? characterId;
  bool isEvilEasterEgg;
  double? x;
  double? y;
  List<Reminder>? reminders;
  bool votedToday = false;
  bool nominatedToday = false;

  set setName(String value) {
    name = value;
  }

  set setNotes(String value) {
    notes = value;
  }

  set setIsDead(bool value) {
    isDead = value;
  }

  set setHasGhostVote(bool value) {
    hasGhostVote = value;
  }

  set setCharacterId(String? value) {
    characterId = value;
  }

  set setIsEvilEasterEgg(bool value) {
    isEvilEasterEgg = value;
  }

  set setX(double value) {
    x = value;
  }

  set setY(double value) {
    y = value;
  }

  set setVotedToday(bool value) {
    votedToday = value;
  }

  set setNominatedToday(bool value) {
    nominatedToday = value;
  }

  set setReminders(List<Reminder>? value) {
    reminders = value;
  }

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        notes = json['notes'] as String,
        isDead = json['isDead'] as bool,
        hasGhostVote = json['hasGhostVote'] as bool,
        characterId = json['characterId'] as String?,
        isEvilEasterEgg = json['isEvilEasterEgg'] as bool,
        x = json['x'] as double?,
        y = json['y'] as double?,
        reminders = json['reminders'] == null
            ? null
            : List.from(json['reminders'])
                .map((item) => Reminder.fromJson(item))
                .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'notes': notes,
      'isDead': isDead,
      'hasGhostVote': hasGhostVote,
      'characterId': characterId,
      'isEvilEasterEgg': isEvilEasterEgg,
      'x': x,
      'y': y,
      'reminders': reminders?.map((reminder) => reminder.toJson()).toList(),
    };
  }
}
