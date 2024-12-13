import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart'
    show Character, InfoToken, Reminder;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show
        CharacterToken,
        InfoTokenCard,
        ModalContentWrapper,
        ReminderToken,
        TokenSlot;

class InfoTokenCompose extends StatefulWidget {
  const InfoTokenCompose({
    super.key,
    required this.infoToken,
    required this.sessionCharacters,
    this.tokenSlots,
    this.removeCustomInfoToken,
  });

  final InfoToken infoToken;
  final List<Character> sessionCharacters;
  final List<Character?>? tokenSlots;
  final void Function(BuildContext context)? removeCustomInfoToken;

  @override
  State<InfoTokenCompose> createState() {
    return _InfoTokenComposeState();
  }
}

class _InfoTokenComposeState extends State<InfoTokenCompose> {
  late final List<dynamic>? _tokenSlots;

  List<dynamic> get tokenOptions {
    return [
      ...widget.sessionCharacters,
      null,
      ...kGeneralReminders,
      Reminder(characterId: 'arrow', reminder: ''),
    ];
  }

  void _onSelectCharacter(BuildContext context, int index) {
    final t = AppLocalizations.of(context);

    selectToken(
        context,
        (ctx) => Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: ModalContentWrapper(
                  title: '${t.select} token',
                  content: Wrap(
                    runSpacing: 6,
                    spacing: 6,
                    children: [
                      for (final token in tokenOptions)
                        Semantics(
                            button: true,
                            label:
                                '${t.select} ${token == null || token is Character ? token?.name : token.tokenId}',
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(ctx);
                                  setState(() {
                                    _tokenSlots!.removeAt(index);
                                    _tokenSlots.insert(index, token);
                                  });
                                },
                                child: token == null || token is Character
                                    ? CharacterToken(
                                        character: token,
                                      )
                                    : ReminderToken(
                                        reminder: token,
                                        character: null,
                                      ))),
                    ],
                  )),
            ));
  }

  @override
  void initState() {
    super.initState();
    _tokenSlots = widget.tokenSlots != null && widget.infoToken.id == 'bluffs'
        ? [...widget.tokenSlots!]
        : widget.infoToken.tokenSlots;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    final content = [
      InfoTokenCard(infoToken: widget.infoToken),
      if (_tokenSlots != null)
        ...List.generate(
          _tokenSlots.length,
          (index) {
            Widget child = const TokenSlot();
            if (_tokenSlots[index] is Character) {
              child = CharacterToken(
                character: _tokenSlots[index],
                tokenSize: TokenSize.large,
              );
            }

            if (_tokenSlots[index] is Reminder) {
              child = ReminderToken(
                reminder: _tokenSlots[index],
                character: null,
                tokenSize: TokenSize.large,
              );
            }

            return Container(
              margin: const EdgeInsets.all(4),
              child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: widget.infoToken.id == 'bluffs'
                      ? null
                      : () => _onSelectCharacter(context, index),
                  child:
                      Container(margin: const EdgeInsets.all(3), child: child)),
            );
          },
        ),
    ];

    final closeButton = ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(120, 40),
      ),
      icon: const Icon(Icons.close),
      label: Text(t.close),
    );

    final removeButton = Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
            widget.removeCustomInfoToken!(context);
          },
          icon: Icon(
            Icons.delete,
            semanticLabel: t.deleteCustomInfoToken,
            size: 28,
          ),
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: isLargeScreen
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ...content,
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.removeCustomInfoToken != null) removeButton,
                        Align(
                            alignment: Alignment.bottomRight,
                            child: closeButton),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      children: [
                        if (widget.removeCustomInfoToken != null) removeButton,
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...content,
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 48),
                                  child: closeButton,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
