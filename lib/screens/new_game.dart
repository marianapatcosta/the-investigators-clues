import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/data/game_setup.dart';
import 'package:my_botc_notes/models/dropdown_item.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/dropdown_search.dart';
import 'package:my_botc_notes/widgets/form_action_bar.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/widgets/number_slider.dart';
import 'package:my_botc_notes/widgets/textfield_with_tags.dart';

const double kMinNumberPlayers = 5.0;
const double kMaxNumberPlayers = 20.0;

class NewGame extends StatefulWidget {
  const NewGame({
    super.key,
  });

  @override
  State<NewGame> createState() {
    return _NewGameState();
  }
}

class _NewGameState extends State<NewGame> {
  double _numberOfPlayers = 10;
  final List<String> _playersNames = [];

  Script? _selectedScript;

  void _onSave(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (_selectedScript == null ||
        _numberOfPlayers < kMinNumberPlayers ||
        _numberOfPlayers > kMaxNumberPlayers) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            t.invalidSetup,
            style: const TextStyle(fontFamily: 'Dumbledore'),
          ),
          content: Text(t.invalidSetupDescription),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Ok'))
          ],
        ),
      );
      return;
    }

    final gameSetup = gameSetups[_numberOfPlayers.round().toString()]!;

    final players = List.generate(
      _numberOfPlayers.toInt(),
      (index) => Player(
        name: index < _playersNames.length ? _playersNames[index] : '',
      ),
    );

    Navigator.of(context).pop(
      GameSession(
          gameSetup: gameSetup, script: _selectedScript!, players: players),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    final slider = SizedBox(
      width: isLargeScreen ? width / 2 : width,
      child: NumberSlider(
        value: _numberOfPlayers,
        onChange: (newValue) {
          setState(() {
            _numberOfPlayers = newValue;
          });
        },
        title: t.numberOfPlayers,
        min: kMinNumberPlayers,
        max: kMaxNumberPlayers,
      ),
    );

    final dropdown = SizedBox(
      width: isLargeScreen ? width / 2 : width,
      child: DropdownSearch<Script>(
        width: isLargeScreen ? width / 2 : width,
        menuHeight: height / 2,
        title: t.script,
        hintText: t.selectScript,
        initialValue: _selectedScript,
        items: kInitialFavoriteScripts
            .map(
              (script) => DropdownItem(
                label: script.name,
                value: script,
              ),
            )
            .toList(),
        onSelect: (value) {
          _selectedScript = value;
        },
      ),
    );

    return Layout(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
          title: Text(t.newGame),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                if (isScreenBiggerThanX(width, ScreenSize.md))
                  Row(
                    children: [
                      Expanded(
                        child: slider,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: dropdown,
                      ),
                    ],
                  )
                else ...[
                  slider,
                  const SizedBox(height: 24),
                  dropdown,
                  const SizedBox(height: 28)
                ],
                TextfieldWithTags(
                  tags: _playersNames,
                  onAddTag: (tag) {
                    _playersNames.add(tag);
                  },
                  onRemoveTag: (tag) {
                    _playersNames.remove(tag);
                  },
                  helperText: t.enterPlayersNamesHelper,
                  hintText: t.namesOfPlayers,
                ),
                const SizedBox(height: 48),
                FormActionBar(onSave: () => _onSave(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
