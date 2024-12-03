import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/game_setup.dart';
import 'package:my_botc_notes/models/game_session.dart';
import 'package:my_botc_notes/models/game_setup.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/providers/favorite_scripts_provider.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/ui/form_action_bar.dart';
import 'package:my_botc_notes/widgets/game_setup/number_players_slider.dart';
import 'package:my_botc_notes/widgets/game_setup/script_selector.dart';
import 'package:my_botc_notes/widgets/ui/textfield_with_tags.dart';

class NewGamePlayerForm extends ConsumerStatefulWidget {
  const NewGamePlayerForm({
    super.key,
  });

  @override
  ConsumerState<NewGamePlayerForm> createState() {
    return _NewGamePlayerFormState();
  }
}

class _NewGamePlayerFormState extends ConsumerState<NewGamePlayerForm> {
  Script? _selectedScript;
  double _numberOfPlayers = 10;
  final List<String> _playersNames = [];

  GameSetup get gameSetup {
    return gameSetups[_numberOfPlayers.round().toString()]!;
  }

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

    final players = List.generate(
        _numberOfPlayers.toInt(),
        (index) => Player(
              name: index < _playersNames.length ? _playersNames[index] : '',
            ));
    Navigator.of(context).pop(GameSession(
      gameSetup: gameSetup,
      script: _selectedScript!,
      players: players,
    ));
  }

  void _onSelectScript(Script? script) {
    setState(() {
      _selectedScript = script;
    });
  }

  void _onUpdatePlayersNumber(double newValue) {
    setState(() {
      _numberOfPlayers = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLargeScreen) ...[
          Row(
            children: [
              Expanded(
                child: ScriptSelector(
                    selectedScript: _selectedScript,
                    favoriteScripts: ref.watch(favoriteScriptsProvider),
                    onSelectScript: _onSelectScript),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: NumberPlayersSlider(
                    numberOfPlayers: _numberOfPlayers,
                    gameSetup: gameSetup,
                    onUpdatePlayersNumber: _onUpdatePlayersNumber),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
        ] else ...[
          ScriptSelector(
              selectedScript: _selectedScript,
              favoriteScripts: ref.watch(favoriteScriptsProvider),
              onSelectScript: _onSelectScript),
          const SizedBox(height: 24),
          NumberPlayersSlider(
              numberOfPlayers: _numberOfPlayers,
              gameSetup: gameSetup,
              onUpdatePlayersNumber: _onUpdatePlayersNumber),
          const SizedBox(height: 12),
        ],
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
