import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/widgets/game_setup/game_setup_table_item.dart';
import 'package:my_botc_notes/widgets/game_setup/game_setup_teams.dart';

const double gameSetupIconSize = 20;

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

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 6,
          children: [
            GameSetupTableItem(
              text: numberOfPlayers.toString(),
              tooltipMessage: t.nPlayers(numberOfPlayers),
              icon: Icon(
                Icons.groups,
                size: gameSetupIconSize,
                color: Colors.green.shade800,
                semanticLabel: t.nPlayers(numberOfPlayers),
              ),
            ),
            GameSetupTableItem(
              text: numberOfAlivePlayers.toString(),
              tooltipMessage: t.nAlivePlayers(numberOfAlivePlayers),
              icon: Icon(
                Icons.favorite,
                size: gameSetupIconSize,
                color: Colors.red.shade600,
                semanticLabel: t.nAlivePlayers(numberOfAlivePlayers),
              ),
            ),
            GameSetupTableItem(
              text: numberOfVotesRequiredToExecute.toString(),
              tooltipMessage: t.nVotesToExecute(numberOfVotesRequiredToExecute),
              icon: Icon(
                Icons.check_box,
                size: gameSetupIconSize,
                semanticLabel:
                    t.nVotesToExecute(numberOfVotesRequiredToExecute),
              ),
            ),
            GameSetupTableItem(
              text: numberOfGhostVotes.toString(),
              tooltipMessage: t.nGhostVotes(numberOfGhostVotes),
              image: ImageIcon(
                const AssetImage("assets/images/shroud-icon.png"),
                size: gameSetupIconSize,
                semanticLabel: t.nGhostVotes(numberOfGhostVotes),
              ),
            ),
          ],
        ),
        GameSetupTeams(
            gameSetup: gameSetup, gameSetupIconSize: gameSetupIconSize),
        if (fabled != null)
          GameSetupTableItem(
            text: fabled!.name,
            tooltipMessage: 'Fabled',
            icon: Icon(
              Icons.person,
              size: gameSetupIconSize,
              color: teamsColors[Team.fabled] as Color,
              semanticLabel: '${fabled!.name} fabled',
            ),
          )
      ],
    );
  }
}
