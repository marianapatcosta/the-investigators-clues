import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart'
    show Character, GameSetup, Team;
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterToken, GameSetupTableItem, GameSetupTeams, ShowToken;

const double _gameSetupIconSize = 20;

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

  void _openShowFabled(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => ShowToken(
        token: CharacterToken(
          character: fabled,
          tokenSize: TokenSize.large,
        ),
        tokenText: fabled?.ability,
      ),
    );
  }

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
                size: _gameSetupIconSize,
                color: Colors.green.shade800,
                semanticLabel: t.nPlayers(numberOfPlayers),
              ),
            ),
            GameSetupTableItem(
              text: numberOfAlivePlayers.toString(),
              tooltipMessage: t.nAlivePlayers(numberOfAlivePlayers),
              icon: Icon(
                Icons.favorite,
                size: _gameSetupIconSize,
                color: Colors.red.shade600,
                semanticLabel: t.nAlivePlayers(numberOfAlivePlayers),
              ),
            ),
            GameSetupTableItem(
              text: numberOfVotesRequiredToExecute.toString(),
              tooltipMessage: t.nVotesToExecute(numberOfVotesRequiredToExecute),
              icon: Icon(
                Icons.check_box,
                size: _gameSetupIconSize,
                semanticLabel:
                    t.nVotesToExecute(numberOfVotesRequiredToExecute),
              ),
            ),
            GameSetupTableItem(
              text: numberOfGhostVotes.toString(),
              tooltipMessage: t.nGhostVotes(numberOfGhostVotes),
              image: ImageIcon(
                const AssetImage("assets/images/shroud-icon.png"),
                size: _gameSetupIconSize,
                semanticLabel: t.nGhostVotes(numberOfGhostVotes),
              ),
            ),
          ],
        ),
        GameSetupTeams(
            gameSetup: gameSetup, gameSetupIconSize: _gameSetupIconSize),
        if (fabled != null)
          Semantics(
            button: true,
            label: '${t.show} ${fabled!.name}',
            child: InkWell(
              onTap: () => _openShowFabled(context),
              child: GameSetupTableItem(
                text: fabled!.name,
                tooltipMessage: 'Fabled',
                icon: Icon(
                  Icons.person,
                  size: _gameSetupIconSize,
                  color: teamsColors[Team.fabled] as Color,
                  semanticLabel: '${fabled!.name} fabled',
                ),
              ),
            ),
          )
      ],
    );
  }
}
