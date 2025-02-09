import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/index.dart';

class PlayerVotingPhase extends StatelessWidget {
  const PlayerVotingPhase({
    super.key,
    required this.gamePhase,
    this.didPlayerVote = false,
    this.didPlayerNominate = false,
    this.wasPlayerNominate = false,
    this.orientation = Orientation.portrait,
    required this.onDidPlayerVoteChange,
    required this.onDidPlayerNominateChange,
    required this.onWasPlayerNominatedChange,
  });

  final String gamePhase;
  final bool didPlayerVote;
  final bool didPlayerNominate;
  final bool wasPlayerNominate;
  final Orientation orientation;
  final Function(bool?)? onDidPlayerVoteChange;
  final Function(bool?)? onDidPlayerNominateChange;
  final Function(bool?)? onWasPlayerNominatedChange;

  DayPhase get dayPhase {
    return DayPhase.values.byName(gamePhase.split('')[0]);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final content = [
      _VotingPhaseCheckbox(
          value: didPlayerVote,
          label: t.playerVoted,
          image: 'voted',
          orientation: orientation,
          onChangeValue: dayPhase == DayPhase.N ? null : onDidPlayerVoteChange),
      SizedBox(
        height: orientation == Orientation.portrait ? 4.0 : 0,
        width: orientation == Orientation.landscape ? 4.0 : 0,
      ),
      _VotingPhaseCheckbox(
          value: didPlayerNominate,
          label: t.playerNominated,
          image: 'nominate',
          orientation: orientation,
          onChangeValue:
              dayPhase == DayPhase.N ? null : onDidPlayerNominateChange),
      SizedBox(
        height: orientation == Orientation.portrait ? 4.0 : 0,
        width: orientation == Orientation.landscape ? 4.0 : 0,
      ),
      _VotingPhaseCheckbox(
          value: wasPlayerNominate,
          label: t.wasPlayerNominated,
          image: 'nominated',
          orientation: orientation,
          onChangeValue:
              dayPhase == DayPhase.N ? null : onWasPlayerNominatedChange),
    ];

    return orientation == Orientation.portrait
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: content,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: content,
          );
  }
}

class _VotingPhaseCheckbox extends StatelessWidget {
  const _VotingPhaseCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.image,
    this.orientation = Orientation.portrait,
    required this.onChangeValue,
  });

  final String label;
  final String image;
  final bool value;
  final Orientation orientation;
  final Function(bool?)? onChangeValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = [
      ImageIcon(
        AssetImage("assets/images/$image.png"),
        semanticLabel: label,
        size: 20,
      ),
      SizedBox(
        height: 20.0,
        width: 20.0,
        child: Checkbox(
          value: value,
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (!states.contains(WidgetState.selected)) {
              return theme.colorScheme.surface;
            }
            return null;
          }),
          onChanged: onChangeValue,
        ),
      ),
    ];

    return Tooltip(
      message: label,
      child: orientation == Orientation.portrait
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: content,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: content,
            ),
    );
  }
}
