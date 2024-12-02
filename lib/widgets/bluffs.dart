import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/character_token.dart';
import 'package:my_botc_notes/widgets/info_token_compose.dart';

class Bluffs extends StatelessWidget {
  const Bluffs({
    super.key,
    required this.title,
    required this.bluffs,
    required this.sessionCharacters,
    required this.updateBluff,
    this.inPlayCharactersIds,
  });

  final List<Character?> bluffs;
  final List<String>? inPlayCharactersIds;
  final List<Character> sessionCharacters;
  final String title;
  final void Function(int index, Character? newBluff) updateBluff;

  List<Character> get availableCharacters {
    final bluffsIds = bluffs.map((character) => character?.id).toList();

    if (inPlayCharactersIds == null) {
      return sessionCharacters
          .where((character) =>
              (character.team == Team.townsfolk ||
                  character.team == Team.outsider) &&
              !bluffsIds.contains(character.id))
          .toList();
    }

    return sessionCharacters
        .where((character) =>
            !inPlayCharactersIds!.contains(character.id) &&
            (character.team == Team.townsfolk ||
                character.team == Team.outsider) &&
            !bluffsIds.contains(character.id))
        .toList();
  }

  void _onSelectCharacter(BuildContext context, int index) {
    selectCharacter(context, sessionCharacters, (character) {
      updateBluff(index, character);
    }, true, availableCharacters);
  }

  void _openShowBluffs(BuildContext context) {
    final infoToken = infoTokens[2];
    infoToken.setTokenSlots = bluffs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => InfoTokenCompose(
        infoToken: infoToken,
        sessionCharacters: sessionCharacters,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 50,
            ),
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () => _openShowBluffs(context),
                  icon: Icon(
                    Icons.visibility,
                    semanticLabel: '${t.show} bluffs',
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 12,
          children: [
            for (int index = 0; index < bluffs.length; index++)
              Semantics(
                button: true,
                label: '${t.select} bluff',
                child: InkWell(
                  onTap: () {
                    _onSelectCharacter(context, index);
                  },
                  child: CharacterToken(
                    character: bluffs[index],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
