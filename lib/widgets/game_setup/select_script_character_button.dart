import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/scripts/character_token.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectScriptCharacterButton extends StatefulWidget {
  const SelectScriptCharacterButton({
    super.key,
    required this.character,
    this.frequency,
    required this.isSelected,
    required this.updateIsSelected,
    this.allowMoreThanOne = false,
  });

  final Character character;
  final int? frequency;
  final bool isSelected;
  final bool allowMoreThanOne;
  final void Function(int numberOfTokens) updateIsSelected;

  @override
  State<SelectScriptCharacterButton> createState() {
    return _SelectScriptCharacterButtonState();
  }
}

class _SelectScriptCharacterButtonState
    extends State<SelectScriptCharacterButton> {
  late int _frequency;

  @override
  void initState() {
    super.initState();
    _frequency = widget.frequency != null && widget.frequency! > 0
        ? widget.frequency!
        : 1;
  }

  void _onToggleIsSelected() {
    if (widget.isSelected) {
      widget.updateIsSelected(0);
      _frequency = 1;
      return;
    }

    widget.updateIsSelected(1);
  }

  void _onShowWarnings() {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Text(
              widget.character.name,
              style: const TextStyle(fontFamily: 'Dumbledore'),
            ),
            const SizedBox(
              width: 4,
            ),
            Icon(
              Icons.warning,
              size: 20,
              color: Colors.red.shade600,
              semanticLabel: t.showSetupWarning,
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OK'))
        ],
        content: Text(widget.character.setupWarning!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Wrap(children: [
      Column(
        children: [
          SizedBox(
            width: kCharacterTokenSizeSmall * 1.3,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Semantics(
                    button: true,
                    label:
                        '${widget.isSelected ? t.unselect : t.select} ${widget.character.name}',
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: _onToggleIsSelected,
                      child: widget.isSelected
                          ? CharacterToken(
                              character: widget.character,
                            )
                          : ColorFiltered(
                              colorFilter: const ColorFilter.matrix(greyMatrix),
                              child: CharacterToken(
                                character: widget.character,
                              ),
                            ),
                    ),
                  ),
                ),
                if (widget.isSelected && widget.character.setupWarning != null)
                  Transform.translate(
                    offset: const Offset(kCharacterTokenSizeSmall - 8, -15),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: _onShowWarnings,
                      icon: Icon(
                        Icons.warning,
                        size: 20,
                        color: Colors.red.shade600,
                        semanticLabel: t.showSetupWarning,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!widget.allowMoreThanOne ||
              widget.allowMoreThanOne && !widget.isSelected)
            const SizedBox(height: 6),
          if (widget.isSelected && widget.allowMoreThanOne)
            SizedBox(
                width: kCharacterTokenSizeSmall * 1.3,
                height: 30,
                child: SizedBox(
                  width: kCharacterTokenSizeSmall * 1.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: _frequency <= 1
                              ? null
                              : () {
                                  setState(() {
                                    _frequency -= 1;
                                    widget.updateIsSelected(_frequency);
                                  });
                                },
                          icon: Icon(
                            Icons.remove,
                            size: 20,
                            semanticLabel: t.removeCharacter,
                          ),
                        ),
                      ),
                      Text(_frequency.toString()),
                      SizedBox(
                        width: 40,
                        height: 30,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: _frequency >= kMaxNumberPlayers
                              ? null
                              : () {
                                  setState(() {
                                    _frequency += 1;
                                    widget.updateIsSelected(_frequency);
                                  });
                                },
                          icon: Icon(
                            Icons.add,
                            size: 20,
                            semanticLabel: '$t.add ${widget.character.name}',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          SizedBox(
            width: kCharacterTokenSizeSmall * 1.3,
            child: Text(
              widget.character.ability,
              style:
                  theme.textTheme.bodySmall!.copyWith(fontSize: 10, height: 1),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ]);
  }
}
