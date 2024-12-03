import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/scripts/character_token.dart';

class ShowDrawnCharacter extends StatefulWidget {
  const ShowDrawnCharacter({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  State<ShowDrawnCharacter> createState() {
    return _ShowDrawnCharacterState();
  }
}

class _ShowDrawnCharacterState extends State<ShowDrawnCharacter> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 8.0, vertical: isLargeScreen ? 36 : 0),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t.thisIsYourCharacter,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 28, height: 1.1),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CharacterToken(
                    character: widget.character,
                    tokenSize: TokenSize.large,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: kCharacterTokenSizeLarge * 1.5,
                    child: Text(
                      widget.character.ability,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 22, height: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: kCharacterTokenSizeLarge * 1.5,
                    child: TextField(
                      controller: _nameController,
                      maxLength: 20,
                      decoration: InputDecoration(label: Text(t.nameOfPlayer)),
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(Player(
                        characterId: widget.character.id,
                        name: _nameController.text,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                    ),
                    icon: const Icon(Icons.check),
                    label: const Text('OK'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
