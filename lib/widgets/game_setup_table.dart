import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/widgets/game_setup_table_item.dart';

const double iconSize = 20;

Map<Team, String?> mapGameSetupToWidgetData(GameSetup gameSetup) {
  return {
    Team.townsfolk: gameSetup.townsfolk.toString(),
    Team.outsider: gameSetup.outsider.toString(),
    Team.minion: gameSetup.minion.toString(),
    Team.demon: gameSetup.demon.toString(),
    Team.traveller: gameSetup.traveller?.toString(),
  };
}

class GameSetupTable extends StatelessWidget {
  const GameSetupTable({
    super.key,
    required this.gameSetup,
    required this.numberOfPlayers,
    required this.numberOfAlivePlayers,
    required this.numberOfGhostVotes,
    required this.numberOfVotesRequiredToExecute,
    required this.fabled,
  });

  final GameSetup gameSetup;
  final int numberOfPlayers;
  final int numberOfAlivePlayers;
  final int numberOfGhostVotes;
  final int numberOfVotesRequiredToExecute;
  final Character? fabled;

  Map<Team, String?> get gameSetupMap {
    return mapGameSetupToWidgetData(gameSetup);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: 8,
              children: [
                GameSetupTableItem(
                  text: numberOfPlayers.toString(),
                  icon: Icon(
                    Icons.groups,
                    size: iconSize,
                    color: Colors.green.shade800,
                    semanticLabel: t.nPlayers(numberOfPlayers),
                  ),
                ),
                GameSetupTableItem(
                  text: numberOfAlivePlayers.toString(),
                  icon: Icon(
                    Icons.favorite,
                    size: iconSize,
                    color: Colors.red.shade600,
                    semanticLabel: t.nAlivePlayers(numberOfAlivePlayers),
                  ),
                ),
                GameSetupTableItem(
                  text: numberOfGhostVotes.toString(),
                  image: ImageIcon(
                    const AssetImage("assets/images/shroud-icon.png"),
                    size: iconSize,
                    semanticLabel: t.nGhostVotes(numberOfGhostVotes),
                  ),
                ),
                GameSetupTableItem(
                  text: numberOfVotesRequiredToExecute.toString(),
                  icon: Icon(
                    Icons.check_box,
                    size: iconSize,
                    semanticLabel:
                        t.nGhostVotes(numberOfVotesRequiredToExecute),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                for (final setup in gameSetupMap.entries)
                  if (setup.value != null)
                    GameSetupTableItem(
                      text: setup.value!,
                      gradientColors: teamsColors[setup.key] is List
                          ? teamsColors[setup.key] as List<Color>
                          : null,
                      icon: Icon(
                        setup.key == 'townsfolk' ? Icons.people : Icons.person,
                        size: iconSize,
                        color: teamsColors[setup.key] is List
                            ? null
                            : teamsColors[setup.key] as Color,
                        semanticLabel: '${setup.value} ${setup.key}',
                      ),
                    ),
              ],
            ),
            if (fabled != null)
              GameSetupTableItem(
                text: fabled!.name,
                icon: Icon(
                  Icons.person,
                  size: iconSize,
                  color: teamsColors[Team.fabled] as Color,
                  semanticLabel: '${fabled!.name} fabled',
                ),
              )
          ],
        ),
      ),
    );
  }
}
