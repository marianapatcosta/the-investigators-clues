import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show GameHistory;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart';

class GameHistoryItem extends StatefulWidget {
  const GameHistoryItem({
    super.key,
    required this.gameHistory,
    required this.isStorytellerMode,
    required this.saveGameSession,
  });

  final GameHistory gameHistory;
  final bool isStorytellerMode;
  final void Function() saveGameSession;

  @override
  State<GameHistoryItem> createState() => _GameHistoryItemState();
}

class _GameHistoryItemState extends State<GameHistoryItem> {
  DayPhase get dayPhase {
    return DayPhase.values.byName(widget.gameHistory.gamePhase.split('')[0]);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return ExpansionTile(
        initiallyExpanded: true,
        shape: const Border(),
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            Text(
              getGamePhaseLabel(
                context,
                widget.gameHistory.gamePhase,
              ),
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              dayPhase == DayPhase.D ? Icons.sunny : Icons.mode_night,
            ),
          ],
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        children: [
          const SizedBox(
            height: 8,
          ),
          if (widget.gameHistory.whoVotedData.isNotEmpty) ...[
            _HistoryInfo(
              title: t.whoVoted,
              imageName: 'voted',
              textList: widget.gameHistory.whoVoted,
              checkboxLabel: t.demonVoted,
              // checkboxIconName: 'flowergirl',
              checkboxValue: widget.gameHistory.demonVoted,
              onChangeCheckboxValue: widget.isStorytellerMode
                  ? null
                  : (newValue) {
                      setState(() {
                        widget.gameHistory.setDemonVoted = newValue ?? false;
                      });
                      widget.saveGameSession();
                    },
            ),
          ],
          if (widget.gameHistory.whoNominatedData.isNotEmpty) ...[
            _HistoryInfo(
              title: t.whoNominated,
              imageName: 'nominate',
              textList: widget.gameHistory.whoNominated,
              checkboxLabel: t.minionNominated,
              checkboxValue: widget.gameHistory.minionNominated,
              // checkboxIconName: 'towncrier',
              onChangeCheckboxValue: widget.isStorytellerMode
                  ? null
                  : (newValue) {
                      setState(() {
                        widget.gameHistory.setMinionNominated =
                            newValue ?? false;
                      });
                      widget.saveGameSession();
                    },
            ),
          ],
          if (widget.gameHistory.whoWasNominated.isNotEmpty) ...[
            _HistoryInfo(
              title: t.whoWasNominated,
              imageName: 'nominated',
              textList: widget.gameHistory.whoWasNominated,
            ),
          ],
          if (widget.gameHistory.whoDied.isNotEmpty) ...[
            _HistoryInfo(
              title: t.whoDied,
              imageName: 'shroud-icon',
              textList: widget.gameHistory.whoDied,
            ),
          ],
          if (widget.gameHistory.whoUsedGhostVote.isNotEmpty) ...[
            _HistoryInfo(
              title: t.whoUsedGhostVote,
              imageName: 'shroud-vote-icon',
              textList: widget.gameHistory.whoUsedGhostVote,
            ),
          ],
          const SizedBox(
            height: 8,
          ),
        ]);
  }
}

class _HistoryInfo extends StatelessWidget {
  const _HistoryInfo({
    super.key,
    required this.title,
    required this.imageName,
    required this.textList,
    this.checkboxLabel,
    this.checkboxIconName,
    this.checkboxValue,
    this.onChangeCheckboxValue,
  });

  final String title;
  final String imageName;
  final List<String> textList;
  final String? checkboxLabel;
  final String? checkboxIconName;
  final bool? checkboxValue;
  final Function(bool?)? onChangeCheckboxValue;

  String get text {
    final listToSort = [...textList];
    listToSort.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return listToSort.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ImageIcon(
              AssetImage("assets/images/$imageName.png"),
              size: 18,
            ),
          ],
        ),
        Text(text),
        const SizedBox(
          height: 8,
        ),
        if (checkboxLabel != null) ...[
          Row(
            children: [
              Text(checkboxLabel!),
              const SizedBox(
                width: 8,
              ),
              if (checkboxIconName != null)
                ImageIcon(
                  AssetImage(
                      '$kCharactersTokensPath/$checkboxIconName.$kCharactersTokensFileFormat'),
                  size: 20,
                ),
              SizedBox(
                height: 20.0,
                width: 20.0,
                child: Checkbox(
                    value: checkboxValue,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (!states.contains(WidgetState.selected)) {
                        return theme.colorScheme.surface;
                      }
                      return null;
                    }),
                    onChanged: onChangeCheckboxValue),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ]
      ],
    );
  }
}
