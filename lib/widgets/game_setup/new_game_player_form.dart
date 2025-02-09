import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart'
    show GameSession, Player, Script;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show FormActionBar, TextfieldWithTags;

class NewGamePlayerForm extends StatefulWidget {
  const NewGamePlayerForm({
    super.key,
    required this.selectedScript,
    required this.numberOfPlayers,
  });

  final Script? selectedScript;
  final double numberOfPlayers;

  @override
  State<NewGamePlayerForm> createState() {
    return _NewGamePlayerFormState();
  }
}

class _NewGamePlayerFormState extends State<NewGamePlayerForm> {
  final List<String> _playersNames = [];

  Size get grimoireSize {
    return getGrimoireSize(context);
  }

  void _onSave(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (widget.selectedScript == null ||
        widget.numberOfPlayers < kMinNumberPlayers ||
        widget.numberOfPlayers > kMaxNumberPlayers) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            t.invalidSetup,
            style: const TextStyle(fontFamily: 'Dumbledore'),
          ),
          content: Text(
            t.invalidPlayersNumber,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final players = List.generate(widget.numberOfPlayers.toInt(), (index) {
      final offset =
          getPlayerOffset(grimoireSize, widget.numberOfPlayers.toInt(), index);
      return Player(
          name: index < _playersNames.length
              ? _playersNames[index]
              : (index + 1).toString(),
          x: offset.dx,
          y: offset.dy);
    });
    Navigator.of(context).pop(GameSession(
      script: widget.selectedScript!,
      players: players,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextfieldWithTags(
          tags: _playersNames,
          onAddTag: (tag) => _playersNames.add(tag),
          onRemoveTag: (tag) => _playersNames.remove(tag),
          helperText: t.enterPlayersNamesHelper,
          hintText: t.namesOfPlayers,
        ),
        const SizedBox(height: 48),
        Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: FormActionBar(onSave: () => _onSave(context)))
      ],
    );
  }
}
