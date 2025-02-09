import 'package:my_botc_notes/models/index.dart';
import 'package:my_botc_notes/utils.dart';

class GameHistory {
  GameHistory({
    required this.gamePhase,
    required this.isStorytellerMode,
    this.whoVotedData = const [],
    this.whoNominatedData = const [],
    this.whoWasNominatedData = const [],
    this.whoDied = const [],
    this.whoUsedGhostVote = const [],
    this.initialDemonVoted = false,
    this.initialMinionNominated = false,
  });

  final String gamePhase;
  final bool isStorytellerMode;
  List<PlayerDataForHistory> whoVotedData;
  List<PlayerDataForHistory> whoNominatedData;
  List<PlayerDataForHistory> whoWasNominatedData;
  List<String> whoDied;
  List<String> whoUsedGhostVote;
  bool initialDemonVoted = false;
  bool initialMinionNominated = false;

  List<String> get whoVoted {
    return whoVotedData.map((item) => item.name).toList();
  }

  List<String> get whoNominated {
    return whoNominatedData.map((item) => item.name).toList();
  }

  List<String> get whoWasNominated {
    return whoWasNominatedData.map((item) => item.name).toList();
  }

  bool get demonVoted {
    if (!isStorytellerMode) {
      return initialDemonVoted;
    }

    return whoVotedData.any((item) => item.team == Team.demon);
  }

  bool get minionNominated {
    if (!isStorytellerMode) {
      return initialMinionNominated;
    }

    return whoNominatedData.any((item) => item.team == Team.minion);
  }

  set setDemonVoted(bool newValue) {
    initialDemonVoted = newValue;
  }

  set setMinionNominated(bool newValue) {
    initialMinionNominated = newValue;
  }

  updateWhoVoted(PlayerDataForHistory player) {
    if (whoVotedData.any((item) => item.id == player.id)) {
      whoVotedData =
          whoVotedData.where((item) => player.id != item.id).toList();
      return;
    }
    whoVotedData = [...whoVotedData, player];
  }

  updateWhoNominated(PlayerDataForHistory player) {
    if (whoNominatedData.any((item) => item.id == player.id)) {
      whoNominatedData =
          whoNominatedData.where((item) => player.id != item.id).toList();
      return;
    }
    whoNominatedData = [...whoNominatedData, player];
  }

  updateWhoWasNominated(PlayerDataForHistory player) {
    if (whoWasNominatedData.any((item) => item.id == player.id)) {
      whoWasNominatedData =
          whoWasNominatedData.where((item) => player.id != item.id).toList();
      return;
    }
    whoWasNominatedData = [...whoWasNominatedData, player];
  }

  updateWhoDied(String playerName) {
    if (whoDied.contains(playerName)) {
      whoDied = whoDied.where((name) => name != playerName).toList();
      return;
    }
    whoDied = [...whoDied, playerName];
  }

  updateWhoUsedGhostVote(String playerName) {
    if (whoUsedGhostVote.contains(playerName)) {
      whoUsedGhostVote =
          whoUsedGhostVote.where((name) => name != playerName).toList();
      return;
    }
    whoUsedGhostVote = [...whoUsedGhostVote, playerName];
  }

  GameHistory.fromJson(Map<String, dynamic> json)
      : gamePhase = json['gamePhase'],
        isStorytellerMode = json['isStorytellerMode'] as bool,
        whoVotedData = List.from(json['whoVotedData'])
            .map((item) => PlayerDataForHistory.fromJson(item))
            .toList(),
        whoNominatedData = List.from(json['whoNominatedData'])
            .map((item) => PlayerDataForHistory.fromJson(item))
            .toList(),
        whoWasNominatedData = List.from(json['whoWasNominatedData'])
            .map((item) => PlayerDataForHistory.fromJson(item))
            .toList(),
        whoDied = List.from(json['whoDied'] as List),
        whoUsedGhostVote = List.from(json['whoUsedGhostVote'] as List),
        initialDemonVoted = json['initialDemonVoted'] as bool,
        initialMinionNominated = json['initialMinionNominated'] as bool;

  Map<String, dynamic> toJson() {
    return {
      'gamePhase': gamePhase,
      'isStorytellerMode': isStorytellerMode,
      'whoVotedData': whoVotedData.map((item) => item.toJson()).toList(),
      'whoNominatedData':
          whoNominatedData.map((item) => item.toJson()).toList(),
      'whoWasNominatedData':
          whoWasNominatedData.map((item) => item.toJson()).toList(),
      'whoDied': whoDied,
      'whoUsedGhostVote': whoUsedGhostVote,
      'initialDemonVoted': initialDemonVoted,
      'initialMinionNominated': initialMinionNominated,
    };
  }
}

class PlayerDataForHistory {
  PlayerDataForHistory({
    required this.id,
    required this.name,
    required this.team,
  });

  final String id;
  final String name;
  final Team? team;

  PlayerDataForHistory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        team = json['team'] == null
            ? null
            : getTeamFromString(json['team'] as String);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'team': team?.name,
    };
  }
}
