import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/widgets/ui/modal_content_wrapper.dart';
import 'package:my_botc_notes/widgets/grimoire/reminder_token.dart';
import 'package:my_botc_notes/widgets/ui/show_more_button.dart';

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
  Character? _getCharacter(String tokenId) {
    if (kGeneralReminders
        .where((reminder) => reminder.tokenId == tokenId)
        .isNotEmpty) {
      return null;
    }

    return charactersMap[tokenId] ??
        widget.sessionCharacters
            .firstWhere((character) => character.id == tokenId);
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
                      character: _getCharacter(reminder.tokenId),
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
