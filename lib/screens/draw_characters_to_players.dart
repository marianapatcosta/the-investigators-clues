import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character, Player;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show Layout, ShowDrawnCharacter;

const kShowModalDelay = 1000; // in ms

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
    extends State<DrawCharactersToPlayersScreen>
    with SingleTickerProviderStateMixin {
  final List<Player> _players = [];
  late List<Character> _charactersToDraw;
  late AnimationController _animationController;
  bool _isDrawingCharacter = false;
  final GlobalKey _shakeState = GlobalKey();

  bool get areAllCharactersDrawn {
    return _charactersToDraw.isEmpty;
  }

  @override
  void initState() {
    super.initState();
    _charactersToDraw = [...widget.scriptCharacters];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: kShowModalDelay,
      ),
      lowerBound: 0, //default
      upperBound: 1, // default
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _onSelectToken() async {
    setState(() {
      _isDrawingCharacter = true;
      _animationController.forward();
    });

    Future.delayed(const Duration(milliseconds: kShowModalDelay), () async {
      final drawnCharacter = _charactersToDraw.first;
      _charactersToDraw.removeAt((0));

      if (mounted) {
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
            character: drawnCharacter,
          ),
        );

        if (player != null) {
          _players.add(player);
        }
      }

      setState(() {
        _animationController.reset();
        _isDrawingCharacter = false;
      });
    });
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
              left: 16,
              right: 16,
              // to lift the modal up when keyboard is focused
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                children: [
                  if (isLargeScreen)
                    const SizedBox(
                      height: 32,
                    ),
                  Text(
                    areAllCharactersDrawn ? t.allDone : t.drawYourCharacter,
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: isLargeScreen ? 48 : 120,
                  ),
                  AnimatedBuilder(
                      key: _shakeState,
                      animation: _animationController,
                      child: Semantics(
                        button: true,
                        label: _isDrawingCharacter ? t.drawing : t.draw,
                        child: InkWell(
                          onTap: _isDrawingCharacter ? null : _onSelectToken,
                          child: Transform.rotate(
                            angle: areAllCharactersDrawn ? 3 : 0,
                            child: SizedBox(
                              width: 170,
                              child: Image(
                                image:
                                    const AssetImage('assets/images/bag.png'),
                                color: theme.colorScheme.primary,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      builder: (ctx, child) {
                        final offsetSinValue =
                            sin(5 * 2 * pi * _animationController.value);

                        return Transform.translate(
                          offset: Offset(offsetSinValue * 10, offsetSinValue),
                          child: child,
                        );
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_charactersToDraw.length}/ ${widget.scriptCharacters.length}',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.person,
                        color: theme.colorScheme.onSurface,
                        semanticLabel: '${t.player}s',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  areAllCharactersDrawn
                      ? ElevatedButton.icon(
                          onPressed: _onSave,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 40),
                          ),
                          icon: const Icon(Icons.save),
                          label: Text(t.save))
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
