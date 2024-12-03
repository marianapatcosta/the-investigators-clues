import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/game_setup/game_setup_table_item.dart';

Map<Team, String?> mapGameSetupToWidgetData(GameSetup gameSetup) {
  return {
    Team.townsfolk: gameSetup.townsfolk.toString(),
    Team.outsider: gameSetup.outsider.toString(),
    Team.minion: gameSetup.minion.toString(),
    Team.demon: gameSetup.demon.toString(),
    Team.traveller: gameSetup.traveller?.toString(),
  };
}

class GameSetupTeams extends StatelessWidget {
  const GameSetupTeams({
    super.key,
    required this.gameSetup,
    this.gameSetupIconSize = 20.0,
  });

  final GameSetup gameSetup;
  final double gameSetupIconSize;

  Map<Team, String?> get gameSetupMap {
    return mapGameSetupToWidgetData(gameSetup);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: [
        for (final setup in gameSetupMap.entries)
          if (setup.value != null)
            GameSetupTableItem(
              text: setup.value!,
              tooltipMessage: '${setup.value!} ${getLabelFromTeam(setup.key)}',
              gradientColors: teamsColors[setup.key] is List
                  ? teamsColors[setup.key] as List<Color>
                  : null,
              icon: Icon(
                setup.key == Team.townsfolk ? Icons.people : Icons.person,
                size: gameSetupIconSize,
                color: teamsColors[setup.key] is List
                    ? null
                    : teamsColors[setup.key] as Color,
                semanticLabel: '${setup.value} ${setup.key}',
              ),
            ),
      ],
    );
  }
}
