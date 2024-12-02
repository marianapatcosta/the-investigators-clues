import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/widgets/new_game_player_form.dart';
import 'package:my_botc_notes/widgets/new_game_storyteller_form%20.dart';

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
  bool _isStorytellerMode = true; // false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

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
              _isStorytellerMode
                  ? const NewGameStorytellerForm()
                  : const NewGamePlayerForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
