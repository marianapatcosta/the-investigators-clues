import 'package:my_botc_notes/constants.dart';

class Player {
  Player({
    this.name = '',
    this.notes = '',
    this.isDead = false,
    this.hasGhostVote = true,
    this.characterId,
    this.isEvilEasterEgg = false,
    this.isTraveller = false,
    this.x,
    this.y,
  }) : id = uuid.v4();

  String id;
  String name;
  String notes;
  bool isDead;
  bool hasGhostVote;
  String? characterId;
  bool isEvilEasterEgg;
  bool isTraveller;
  double? x;
  double? y;
  bool votedToday = false;
  bool nominatedToday = false;
  bool wasNominatedToday = false;

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

  set setWasNominatedToday(bool value) {
    wasNominatedToday = value;
  }

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        notes = json['notes'] as String,
        isDead = json['isDead'] as bool,
        hasGhostVote = json['hasGhostVote'] as bool,
        characterId = json['characterId'] as String?,
        isEvilEasterEgg = json['isEvilEasterEgg'] as bool,
        isTraveller = json['isTraveller'] as bool,
        x = json['x'] as double?,
        y = json['y'] as double?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'notes': notes,
      'isDead': isDead,
      'hasGhostVote': hasGhostVote,
      'characterId': characterId,
      'isEvilEasterEgg': isEvilEasterEgg,
      'isTraveller': isTraveller,
      'x': x,
      'y': y,
    };
  }
}
