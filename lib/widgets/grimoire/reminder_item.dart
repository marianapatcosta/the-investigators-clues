import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/widgets/grimoire/reminder_token.dart';
import 'package:my_botc_notes/widgets/grimoire/info_tokens/show_token.dart';

class ReminderItem extends StatefulWidget {
  const ReminderItem({
    super.key,
    required this.reminder,
    required this.constraints,
    required this.sessionCharacters,
    required this.removeReminder,
    required this.saveGameSession,
    this.isDead = false,
    this.tokenSize = TokenSize.small,
  });

  final Reminder reminder;
  final BoxConstraints constraints;
  final List<Character> sessionCharacters;
  final bool isDead;
  final TokenSize tokenSize;
  final void Function() removeReminder;
  final void Function() saveGameSession;

  Character? get character {
    return charactersMap[reminder.tokenId] ??
        sessionCharacters
            .where((character) => character.id == reminder.tokenId)
            .toList()
            .firstOrNull;
  }

  @override
  State<ReminderItem> createState() {
    return _ReminderItemState();
  }
}

class _ReminderItemState extends State<ReminderItem> {
  void _onDeleteReminder(BuildContext context) {
    widget.removeReminder();
    Navigator.of(context).pop();
  }

  void _openShowReminder(BuildContext context) async {
    final t = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => ShowToken(
          token: ReminderToken(
            reminder: widget.reminder,
            character: widget.character,
            tokenSize: TokenSize.large,
          ),
          actionWidget: IconButton(
            onPressed: () => _onDeleteReminder(context),
            icon: Icon(
              Icons.delete,
              semanticLabel: t.deleteReminder,
              size: 28,
            ),
          )),
    );
  }

  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset(widget.reminder.x ?? 10, widget.reminder.y ?? 10);
  }

  @override
  Widget build(BuildContext context) {
    final Reminder(:id, tokenId: characterId, :reminder) = widget.reminder;
    final t = AppLocalizations.of(context);

    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Semantics(
        button: true,
        label: '${t.show} $reminder',
        child: GestureDetector(
          onTap: () {
            _openShowReminder(context);
          },
          onPanUpdate: (details) {
            setState(() {
              double limitX = (_offset.dx + details.delta.dx)
                  .clamp(
                      0, widget.constraints.maxWidth - kCharacterTokenSizeSmall)
                  .toDouble();

              double limitY = (_offset.dy + details.delta.dy)
                  .clamp(0,
                      widget.constraints.maxHeight - kCharacterTokenSizeSmall)
                  .toDouble();

              _offset = Offset(limitX, limitY);
            });
          },
          onPanEnd: (details) {
            widget.reminder.x = _offset.dx;
            widget.reminder.y = _offset.dy;
            widget.saveGameSession();
          },
          child: widget.isDead
              ? ColorFiltered(
                  colorFilter: const ColorFilter.matrix(greyMatrix),
                  child: ReminderToken(
                    reminder: widget.reminder,
                    character: widget.character,
                  ),
                )
              : ReminderToken(
                  reminder: widget.reminder,
                  character: widget.character,
                ),
        ),
      ),
    );
  }
}
