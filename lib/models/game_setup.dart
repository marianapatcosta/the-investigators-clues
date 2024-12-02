import 'package:my_botc_notes/models/character.dart';

class GameSetup {
  GameSetup({
    required this.townsfolk,
    required this.outsider,
    required this.minion,
    required this.demon,
  });

  final int townsfolk;
  final int outsider;
  final int minion;
  final int demon;
  int? traveller;

  set setTraveller(int newTraveller) {
    traveller = newTraveller;
  }

  int getValueFromTeam(Team team) {
    if (team == Team.townsfolk) {
      return townsfolk;
    }
    if (team == Team.outsider) {
      return outsider;
    }
    if (team == Team.minion) {
      return minion;
    }
    if (team == Team.demon) {
      return demon;
    }
    if (team == Team.traveller) {
      return traveller ?? 0;
    }
    return 0;
  }

  GameSetup.fromJson(Map<String, dynamic> json)
      : townsfolk = json['townsfolk'] as int,
        outsider = json['outsider'] as int,
        minion = json['minion'] as int,
        demon = json['demon'] as int,
        traveller = json['traveller'] as int?;

  Map<String, dynamic> toJson() {
    return {
      'townsfolk': townsfolk,
      'outsider': outsider,
      'minion': minion,
      'demon': demon,
      'traveller': traveller,
    };
  }
}
