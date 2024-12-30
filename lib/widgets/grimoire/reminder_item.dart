import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart' show Character, Reminder;
import 'package:my_botc_notes/providers/index.dart';
import 'package:my_botc_notes/widgets/index.dart' show ReminderToken, ShowToken;

class ReminderItem extends ConsumerStatefulWidget {
  const ReminderItem({
    super.key,
    required this.reminder,
    required this.constraints,
    required this.sessionCharacters,
    this.tokenSize = TokenSize.small,
    required this.removeReminder,
    required this.saveGameSession,
  });

  final Reminder reminder;
  final BoxConstraints constraints;
  final List<Character> sessionCharacters;
  final TokenSize tokenSize;
  final void Function() removeReminder;
  final void Function() saveGameSession;

  Character? get character {
    return charactersMap[reminder.characterId] ??
        sessionCharacters
            .where((character) => character.id == reminder.characterId)
            .toList()
            .firstOrNull;
  }

  @override
  ConsumerState<ReminderItem> createState() {
    return _ReminderItemState();
  }
}

class _ReminderItemState extends ConsumerState<ReminderItem> {
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
    final Reminder(:id, characterId: characterId, :reminder) = widget.reminder;
    final t = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);

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
          child: Transform.scale(
            scale: settings.reminderTokenScale,
            child: ReminderToken(
              reminder: widget.reminder,
              character: widget.character,
            ),
          ),
        ),
      ),
    );
  }
}
