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

  GameSetup copyWith({
    int? townsfolk,
    int? outsider,
    int? minion,
    int? demon,
  }) {
    return GameSetup(
      townsfolk: townsfolk ?? this.townsfolk,
      outsider: outsider ?? this.outsider,
      minion: minion ?? this.minion,
      demon: demon ?? this.demon,
    );
  }
}
