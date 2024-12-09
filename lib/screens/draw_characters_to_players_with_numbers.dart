import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character, Player;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterToken, FormActionBar, Layout, ShowDrawnCharacter, TokenSlot;

class DrawCharactersToPlayersWithNumbersScreen extends StatefulWidget {
  const DrawCharactersToPlayersWithNumbersScreen({
    super.key,
    required this.scriptCharacters,
  });

  final List<Character> scriptCharacters;

  @override
  State<DrawCharactersToPlayersWithNumbersScreen> createState() {
    return _DrawCharactersToPlayersWithNumbersScreenState();
  }
}

class _DrawCharactersToPlayersWithNumbersScreenState
    extends State<DrawCharactersToPlayersWithNumbersScreen> {
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
        child: Padding(
          padding: EdgeInsets.only(
              top: 16,
              left: 4,
              right: 4,
              // to lift the modal up when keyboard is focused
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
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
                ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: kBreakpoints[ScreenSize.md]!),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (int index = 0;
                          index < widget.scriptCharacters.length;
                          index++)
                        Semantics(
                          button: true,
                          label: '${t.select} item ${(index + 1).toString()}',
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: _selectedCharactersIndexes.contains(index)
                                ? null
                                : () {
                                    _onSelectToken(index);
                                  },
                            child: _selectedCharactersIndexes.contains(index)
                                ? ColorFiltered(
                                    colorFilter:
                                        const ColorFilter.matrix(greyMatrix),
                                    child: TokenSlot(
                                      size: size,
                                    ),
                                  )
                                : CharacterToken(
                                    tokenText: (index + 1).toString(),
                                    tokenSize: isLargeScreen
                                        ? TokenSize.large
                                        : TokenSize.medium,
                                  ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                FormActionBar(
                  onSave: _onSave,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
