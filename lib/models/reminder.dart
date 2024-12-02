import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Reminder {
  Reminder({
    required this.tokenId,
    required this.reminder,
    this.x,
    this.y,
  }) : id = uuid.v4();

  final String id;
  final String tokenId;
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
        tokenId = json['characterId'] as String,
        reminder = json['reminder'],
        x = json['x'] as double?,
        y = json['y'] as double?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'characterId': tokenId,
      'reminder': reminder,
      'x': x,
      'y': y,
    };
  }
}
