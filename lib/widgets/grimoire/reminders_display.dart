import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart';
import 'package:my_botc_notes/models/index.dart';
import 'package:my_botc_notes/widgets/index.dart';

class RemindersDisplay extends StatelessWidget {
  const RemindersDisplay({
    super.key,
    required this.reminders,
    required this.sessionCharacters,
    required this.onRemoveReminder,
  });

  final List<Reminder> reminders;
  final List<Character> sessionCharacters;
  final void Function(Reminder) onRemoveReminder;

  Character? _getCharacter(String characterId) {
    if (kGeneralReminders
        .where((reminder) => reminder.characterId == characterId)
        .isNotEmpty) {
      return null;
    }

    return charactersMap[characterId] ??
        sessionCharacters
            .firstWhere((character) => character.id == characterId);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: reminders.isEmpty
          ? Text(t.noReminders)
          : Wrap(
              runSpacing: 6,
              spacing: 6,
              alignment: WrapAlignment.start,
              children: [
                for (final reminder in reminders)
                  Wrap(children: [
                    SizedBox(
                      width: kReminderTokenSizeSmall * 1.2,
                      child: Stack(
                        children: [
                          ReminderToken(
                            reminder: reminder,
                            character: _getCharacter(reminder.characterId),
                          ),
                          Positioned(
                              right: -17,
                              top: -15,
                              child: IconButton(
                                onPressed: () {
                                  onRemoveReminder(reminder);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  semanticLabel: t.deleteGame,
                                  size: 18,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ])
              ],
            ),
    );
  }
}
