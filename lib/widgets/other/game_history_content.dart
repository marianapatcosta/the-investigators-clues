import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/index.dart' show Character, GameHistory;
import 'package:my_botc_notes/screens/index.dart' show CharacterDetailsScreen;
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show GameHistoryItem;

class GameHistoryContent extends StatelessWidget {
  const GameHistoryContent({
    super.key,
    required this.gameHistory,
    required this.isStorytellerMode,
    required this.saveGameSession,
  });

  final List<GameHistory> gameHistory;
  final bool isStorytellerMode;
  final void Function() saveGameSession;

  bool get hasNoHistoryInformation {
    return gameHistory.length == 1 &&
        gameHistory.first.gamePhase == initialGamePhase;
  }

  void seeCharacterDetails(BuildContext context, Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => CharacterDetailsScreen(
          character: character,
        ),
      ),
    );
  }

  bool shouldRenderItem(GameHistory gameHistory) {
    final GameHistory(
      whoVotedData: whoVoted,
      whoNominatedData: whoNominated,
      :whoWasNominated,
      :whoDied,
      :whoUsedGhostVote
    ) = gameHistory;
    return whoVoted.isNotEmpty ||
        whoNominated.isNotEmpty ||
        whoWasNominated.isNotEmpty ||
        whoDied.isNotEmpty ||
        whoUsedGhostVote.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: hasNoHistoryInformation
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (hasNoHistoryInformation) ...[
              const SizedBox(
                height: 72,
              ),
              Text(
                t.noHistory,
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              )
            ] else if (isScreenBiggerThanX(width, ScreenSize.md))
              Wrap(
                  runAlignment: WrapAlignment.start,
                  runSpacing: 16,
                  spacing: 36,
                  children: [
                    for (final item in gameHistory)
                      if (shouldRenderItem(item))
                        SizedBox(
                            width: width / 3.8,
                            child: GameHistoryItem(
                              gameHistory: item,
                              isStorytellerMode: isStorytellerMode,
                              saveGameSession: saveGameSession,
                            ))
                  ])
            else
              for (final item in gameHistory)
                if (shouldRenderItem(item))
                  GameHistoryItem(
                    gameHistory: item,
                    isStorytellerMode: isStorytellerMode,
                    saveGameSession: saveGameSession,
                  ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
