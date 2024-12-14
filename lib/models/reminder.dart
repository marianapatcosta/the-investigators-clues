import 'package:my_botc_notes/constants.dart';

class Reminder {
  Reminder({
    required this.characterId,
    required this.reminder,
    this.x,
    this.y,
  }) : id = uuid.v4();

  final String id;
  final String characterId;
  final String reminder;
  double? x;
  double? y;

  set setX(value) {
    x = value;
  }

  set setY(value) {
    y = value;
  }

  Reminder.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        characterId = json['characterId'] as String,
        reminder = json['reminder'],
        x = json['x'] as double?,
        y = json['y'] as double?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'characterId': characterId,
      'reminder': reminder,
      'x': x,
      'y': y,
    };
  }
}
