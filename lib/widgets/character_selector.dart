import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/character_token.dart';
import 'package:my_botc_notes/widgets/modal_content_wrapper.dart';

class CharacterSelector extends StatelessWidget {
  const CharacterSelector({
    super.key,
    required this.characters,
    required this.onSelectCharacter,
  });

  final List<Character> characters;
  final void Function(Character) onSelectCharacter;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ModalContentWrapper(
        title: t.selectCharacter,
        content: Wrap(
          runSpacing: 6,
          spacing: 6,
          children: [
            for (final character in characters)
              Semantics(
                button: true,
                label: '${t.select} ${character.name}',
                child: InkWell(
                  onTap: () {
                    onSelectCharacter(character);
                  },
                  child: CharacterToken(
                    character: character,
                  ),
                ),
              )
          ],
        ));
  }
}
