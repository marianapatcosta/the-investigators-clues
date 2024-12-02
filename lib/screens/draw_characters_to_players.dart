import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/widgets/show_drawn_character.dart';

class DrawCharactersToPlayersScreen extends StatefulWidget {
  const DrawCharactersToPlayersScreen({
    super.key,
    required this.scriptCharacters,
  });

  final List<Character> scriptCharacters;

  @override
  State<DrawCharactersToPlayersScreen> createState() {
    return _DrawCharactersToPlayersScreenState();
  }
}

class _DrawCharactersToPlayersScreenState
    extends State<DrawCharactersToPlayersScreen> {
  final List<Player> _players = [];
  final List<int> _selectedCharactersIndexes = [];

  void _onSelectToken(int index) async {
    setState(() {
      _selectedCharactersIndexes.add(index);
    });
    final Player? player = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => ShowDrawnCharacter(
        character: widget.scriptCharacters[index],
      ),
    );

    if (player != null) {
      _players.add(player);
    }
  }

  void _onSave() {
    Navigator.of(context).pop(_players);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    final size =
        isLargeScreen ? kCharacterTokenSizeLarge : kCharacterTokenSizeMedium;

    return Layout(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
        title: Text(t.drawCharacters),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                width: isLargeScreen ? 300 : double.infinity,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                t.drawYourCharacter,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 48,
              ),
              const Image(
                image: AssetImage('assets/images/bag.png'),
              ),
              const SizedBox(
                height: 56,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _onSave();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 40),
                ),
                icon: const Icon(Icons.save),
                label: Text(t.save),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
