import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart' show Character, Reminder;
import 'package:my_botc_notes/widgets/index.dart'
    show ModalContentWrapper, ReminderToken, ShowMoreButton;

class ReminderSelector extends StatefulWidget {
  const ReminderSelector({
    super.key,
    required this.inPlayCharactersReminders,
    required this.otherReminders,
    required this.sessionCharacters,
    required this.onSelectReminder,
  });

  final List<Reminder> inPlayCharactersReminders;
  final List<Reminder> otherReminders;
  final List<Character> sessionCharacters;
  final void Function(Reminder) onSelectReminder;

  @override
  State<ReminderSelector> createState() {
    return _ReminderSelectorState();
  }
}

class _ReminderSelectorState extends State<ReminderSelector> {
  Character? _getCharacter(String characterId) {
    if (kGeneralReminders
        .where((reminder) => reminder.characterId == characterId)
        .isNotEmpty) {
      return null;
    }

    return charactersMap[characterId] ??
        widget.sessionCharacters
            .firstWhere((character) => character.id == characterId);
  }

  bool _showAllReminders = false;

  List<Reminder> get reminders {
    if (_showAllReminders) {
      return [...widget.inPlayCharactersReminders, ...widget.otherReminders];
    }

    return widget.inPlayCharactersReminders;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ModalContentWrapper(
        title: t.selectReminder,
        content: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Wrap(
            runSpacing: 6,
            spacing: 6,
            children: [
              for (final reminder in reminders)
                Semantics(
                  button: true,
                  label: '${t.select} ${reminder.reminder}',
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      widget.onSelectReminder(reminder);
                    },
                    child: ReminderToken(
                      reminder: reminder,
                      character: _getCharacter(reminder.characterId),
                    ),
                  ),
                ),
              ShowMoreButton(
                  size: kReminderTokenSizeSmall,
                  showMore: !_showAllReminders,
                  toggleShowMore: () {
                    setState(() {
                      _showAllReminders = !_showAllReminders;
                    });
                  })
            ],
          ),
        ));
  }
}
