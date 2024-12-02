import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/utils.dart';

enum DayPhase { D, N }

class GamePhase extends StatelessWidget {
  const GamePhase({
    super.key,
    required this.gamePhase,
    required this.onUpdateGamePhase,
  });

  final String gamePhase;
  final void Function(String) onUpdateGamePhase;

  DayPhase get dayPhase {
    return DayPhase.values.byName(gamePhase.split('')[0]);
  }

  String get dayPhaseLabel {
    final dayPhase = DayPhase.values.byName(gamePhase.split('')[0]);
    if (dayPhase == DayPhase.D) {
      return 'day';
    }
    return 'night';
  }

  int get dayCount {
    return int.parse(gamePhase.split('').sublist(1).join());
  }

  void _setPreviousGamePhase() {
    final updatedDayPhase = dayPhase == DayPhase.N ? DayPhase.D : DayPhase.N;
    final updatedDayCount = dayPhase == DayPhase.N ? dayCount - 1 : dayCount;
    final updatedGamePhase = '${updatedDayPhase.name}$updatedDayCount';
    onUpdateGamePhase(updatedGamePhase);
  }

  void _setNextGamePhase() {
    final updatedDayPhase = dayPhase == DayPhase.N ? DayPhase.D : DayPhase.N;
    final updatedDayCount = dayPhase == DayPhase.N ? dayCount : dayCount + 1;
    final updatedGamePhase = '${updatedDayPhase.name}$updatedDayCount';
    onUpdateGamePhase(updatedGamePhase);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final getTranslationKey = getTranslationKeyGetter(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: dayCount == 1 && dayPhase == DayPhase.N
                ? null
                : _setPreviousGamePhase,
            icon: Icon(Icons.arrow_back_ios,
                size: 16, color: theme.colorScheme.primary)),
        Text(
          '${getTranslationKey(dayPhaseLabel)} $dayCount',
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(
          width: 8,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
          child: dayPhase == DayPhase.D
              ? Icon(
                  Icons.sunny,
                  semanticLabel: t.updateGamePhase,
                  key: Key(DayPhase.D.name),
                )
              : Icon(
                  Icons.mode_night,
                  semanticLabel: t.updateGamePhase,
                  key: Key(DayPhase.N.name),
                ),
        ),
        IconButton(
          onPressed: dayCount == 20 && dayPhase == DayPhase.D
              ? null
              : _setNextGamePhase,
          icon: Icon(Icons.arrow_forward_ios,
              size: 16, color: theme.colorScheme.primary),
        ),
      ],
    );
  }
}
