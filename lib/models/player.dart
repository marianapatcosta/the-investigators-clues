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

  set setName(value) {
    name = value;
  }

  set setNotes(value) {
    notes = value;
  }

  set setIsDead(value) {
    isDead = value;
  }

  set setHasGhostVote(value) {
    hasGhostVote = value;
  }

  set setCharacterId(value) {
    characterId = value;
  }

  set setIsEvilEasterEgg(value) {
    isEvilEasterEgg = value;
  }

  set setX(value) {
    x = value;
  }

  set setY(value) {
    y = value;
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
      'x': x,
      'y': y
    };
  }
}
