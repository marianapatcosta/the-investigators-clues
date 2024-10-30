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
