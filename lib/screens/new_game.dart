import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show gameSetups;
import 'package:my_botc_notes/models/index.dart' show GameSetup, Script;
import 'package:my_botc_notes/providers/index.dart'
    show favoriteScriptsProvider;
import 'package:my_botc_notes/widgets/index.dart'
    show
        Layout,
        NewGamePlayerForm,
        NewGameStorytellerForm,
        NumberPlayersSlider,
        ScriptSelector;
import 'package:my_botc_notes/utils.dart';

class NewGame extends ConsumerStatefulWidget {
  const NewGame({
    super.key,
  });

  @override
  ConsumerState<NewGame> createState() {
    return _NewGameState();
  }
}

class _NewGameState extends ConsumerState<NewGame> {
  bool _isStorytellerMode = true; // false;
  Script? _selectedScript;
  double _numberOfPlayers = 10;

  GameSetup get gameSetup {
    return gameSetups[_numberOfPlayers.toInt().toString()]!.copyWith();
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
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

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
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    //width: 200,
                    child: RadioListTile(
                      title: Text(
                        t.playerMode,
                        style: theme.textTheme.titleMedium,
                      ),
                      value: false,
                      groupValue: _isStorytellerMode,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isStorytellerMode = newValue ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      title: Text(
                        t.storytellerMode,
                        style: theme.textTheme.titleMedium,
                      ),
                      value: true,
                      groupValue: _isStorytellerMode,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isStorytellerMode = newValue ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
              _isStorytellerMode
                  ? NewGameStorytellerForm(
                      selectedScript: _selectedScript,
                      numberOfPlayers: _numberOfPlayers,
                    )
                  : NewGamePlayerForm(
                      selectedScript: _selectedScript,
                      numberOfPlayers: _numberOfPlayers,
                    ),
            ],
          ),
        ),
      ),
    ));
  }
}
