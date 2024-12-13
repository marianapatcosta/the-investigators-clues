import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart'
    show Character, CustomInfoToken, InfoToken, Reminder;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show
        AddCustomInfoToken,
        CharacterToken,
        InfoTokenCompose,
        ModalContentWrapper,
        ReminderToken,
        ShowToken;

const _buttonMaxWidth = 300.0;
const _widthFactor = 0.42;
const _spacing = 8.0;
const _maxCustomInfoTokens = 6;

class InfoTokenSelector extends StatefulWidget {
  const InfoTokenSelector({
    super.key,
    required this.sessionCharacters,
    required this.tokenSlots,
    required this.inPlayCharactersIds,
    required this.sessionReminders,
    required this.customInfoTokens,
    required this.saveCustomInfoToken,
    required this.removeCustomInfoToken,
  });

  final List<String> inPlayCharactersIds;
  final List<Character> sessionCharacters;
  final List<Character?>? tokenSlots;
  final List<Reminder> sessionReminders;
  final List<InfoToken>? customInfoTokens;
  final void Function(CustomInfoToken) saveCustomInfoToken;
  final void Function(int) removeCustomInfoToken;

  @override
  State<InfoTokenSelector> createState() {
    return _InfoTokenSelectorState();
  }
}

class _InfoTokenSelectorState extends State<InfoTokenSelector> {
  late List<InfoToken> _customInfoTokens;

  @override
  void initState() {
    super.initState();
    _customInfoTokens = widget.customInfoTokens ?? [];
  }

  void _onSaveCustomInfoToken(CustomInfoToken customInfoToken) {
    widget.saveCustomInfoToken(customInfoToken);
    final CustomInfoToken(:text, :tokenSlotsNumber) = customInfoToken;

    setState(() {
      _customInfoTokens.add(InfoToken(
        id: text,
        label: text,
        regularPart1: text,
        bold: '',
        regularPart2: '',
        tokenSlots: tokenSlotsNumber != null
            ? List.generate(tokenSlotsNumber, (index) => null)
            : null,
      ));
    });
  }

  void _onRemoveCustomInfoToken(BuildContext context, int customInfoTokenIndex,
      [bool updateState = true]) {
    final t = AppLocalizations.of(context);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(t.removeCustomInfoToken(
            _customInfoTokens[customInfoTokenIndex].label)),
      ),
    );

    widget.removeCustomInfoToken(customInfoTokenIndex);
    if (updateState) {
      setState(() {
        _customInfoTokens.removeAt(customInfoTokenIndex);
      });
      return;
    }
    _customInfoTokens.removeAt(customInfoTokenIndex);
  }

  void _onSelectInfoToken(BuildContext context, InfoToken infoToken,
      [int? infoTokenIndex]) {
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
              sessionCharacters: widget.sessionCharacters,
              tokenSlots: widget.tokenSlots,
              removeCustomInfoToken: infoTokenIndex != null
                  ? (context) =>
                      _onRemoveCustomInfoToken(ctx, infoTokenIndex, false)
                  : null,
            ));
  }

  void _onSelectAddCustomToken(BuildContext context) {
    if (_customInfoTokens.length >= _maxCustomInfoTokens) {
      final t = AppLocalizations.of(context);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            t.tooManyCustomInfoTokens,
            style: const TextStyle(fontFamily: 'Dumbledore'),
          ),
          content:
              Text(t.tooManyCustomInfoTokensDescription(_maxCustomInfoTokens)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('OK'))
          ],
        ),
      );
      return;
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (ctx) => AddCustomInfoToken(
              saveCustomInfoToken: _onSaveCustomInfoToken,
            ));
  }

  void _onSelectCharacter(BuildContext context) {
    selectCharacter(context, widget.sessionCharacters.toList(), (character) {
      _openShowCharacter(context, character);
    }, true);
  }

  void _onSelectReminder(BuildContext context) {
    final List<Reminder> inPlayCharactersReminders = [...kGeneralReminders];
    final List<Reminder> otherReminders = [];

    for (final reminder in widget.sessionReminders) {
      if (widget.inPlayCharactersIds.contains(reminder.characterId)) {
        inPlayCharactersReminders.add(reminder);
      } else {
        otherReminders.add(reminder);
      }
    }

    selectReminder(
        context,
        inPlayCharactersReminders,
        otherReminders,
        widget.sessionCharacters,
        (reminder) => _openShowReminder(
              context,
              reminder,
            ));
  }

  void _openShowCharacter(BuildContext context, Character? character) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => ShowToken(
        token: CharacterToken(
          character: character,
          tokenSize: TokenSize.large,
        ),
        tokenText: character?.ability,
      ),
    );
  }

  void _openShowReminder(BuildContext context, Reminder reminder) async {
    Navigator.of(context).pop();

    final character = charactersMap[reminder.characterId] ??
        widget.sessionCharacters
            .where((character) => character.id == reminder.characterId)
            .toList()
            .firstOrNull;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) => ShowToken(
        token: ReminderToken(
          reminder: reminder,
          character: character,
          tokenSize: TokenSize.large,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final getTranslationKey = getTranslationKeyGetter(context);
    final width = MediaQuery.of(context).size.width;
    Widget infoTokenButton(InfoToken infoToken, [int? customInfoTokenIndex]) =>
        Container(
          width: width * _widthFactor,
          constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _onSelectInfoToken(context, infoToken, customInfoTokenIndex);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: customInfoTokenIndex != null
                    ? theme.colorScheme.primary.withOpacity(0.7)
                    : theme.colorScheme.surface,
                shadowColor: Colors.transparent,
                foregroundColor: theme.colorScheme.onSurface,
                minimumSize: const Size.fromHeight(55),
                shape: customInfoTokenIndex != null
                    ? RoundedRectangleBorder(
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                        ),
                      )
                    : null),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                getTranslationKey(infoToken.label) ?? infoToken.label,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall!.copyWith(
                    height: 1.0,
                    fontSize: 18,
                    color: customInfoTokenIndex != null ? Colors.white : null),
              ),
            ),
          ),
        );

    return ModalContentWrapper(
        title: t.selectInfoToken,
        content: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 8,
            spacing: _spacing,
            children: [
              for (final infoToken in infoTokens) ...[
                infoTokenButton(infoToken),
              ],
              for (int index = 0;
                  index < _customInfoTokens.length;
                  index++) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Dismissible(
                      background: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              theme.colorScheme.primary.withOpacity(0.70),
                              theme.colorScheme.primary.withOpacity(0.0),
                            ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                      ),
                      direction: index % 2 == 0
                          ? DismissDirection.endToStart
                          : DismissDirection.startToEnd,
                      key: ValueKey(_customInfoTokens[index].id),
                      onDismissed: (direction) =>
                          _onRemoveCustomInfoToken(context, index),
                      child: infoTokenButton(_customInfoTokens[index], index)),
                ),
              ],
              if (_customInfoTokens.length % 2 != 0)
                Container(
                  width: width * _widthFactor,
                  constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
                ),
              Container(
                width: width * _widthFactor,
                constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(55)),
                  onPressed: () {
                    _onSelectCharacter(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      t.showCharacter,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * _widthFactor,
                constraints: const BoxConstraints(maxWidth: _buttonMaxWidth),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(55)),
                  onPressed: () {
                    _onSelectReminder(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      t.showReminder,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * _widthFactor * 2 + _spacing,
                constraints: const BoxConstraints(
                    maxWidth: _buttonMaxWidth * 2 + _spacing),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      minimumSize: const Size.fromHeight(55)),
                  onPressed: () {
                    _onSelectAddCustomToken(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      t.addCustomToken,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
