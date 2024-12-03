import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerVotedNominated extends StatelessWidget {
  const PlayerVotedNominated({
    super.key,
    this.didPlayerVote = false,
    this.didPlayerNominate = false,
    required this.onDidPlayerVoteChange,
    required this.onDidPlayerNominateChange,
  });

  final bool didPlayerVote;
  final bool didPlayerNominate;
  final Function(bool?)? onDidPlayerVoteChange;
  final Function(bool?)? onDidPlayerNominateChange;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: t.playerVoted,
          child: Row(children: [
            Icon(
              Icons.front_hand_outlined,
              size: 20,
              semanticLabel: t.playerVoted,
            ),
            SizedBox(
              height: 20.0,
              width: 20.0,
              child: Checkbox(
                value: didPlayerVote,
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (!states.contains(WidgetState.selected)) {
                    return theme.colorScheme.surface;
                  }
                  return null;
                }),
                onChanged: onDidPlayerVoteChange,
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Tooltip(
          message: t.playerNominated,
          child: Row(
            children: [
              ImageIcon(
                const AssetImage("assets/images/pointing_finger.png"),
                semanticLabel: t.playerNominated,
                size: 20,
              ),
              SizedBox(
                height: 20.0,
                width: 20.0,
                child: Checkbox(
                  value: didPlayerNominate,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (!states.contains(WidgetState.selected)) {
                      return theme.colorScheme.surface;
                    }
                    return null;
                  }),
                  onChanged: onDidPlayerNominateChange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
