import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show characters;
import 'package:my_botc_notes/models/index.dart' show Character, Team;
import 'package:my_botc_notes/screens/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterToken, GhostVoteToken, ShowToken;

class EditPlayerHeader extends StatelessWidget {
  const EditPlayerHeader({
    super.key,
    required this.playerId,
    required this.playerName,
    required this.isDead,
    required this.hasGhostVote,
    required this.isEvilEasterEgg,
    required this.isStorytellerMode,
    required this.sessionCharacters,
    required this.removePlayer,
    required this.toggleIsEvilEasterEgg,
    required this.selectPlayerCharacter,
    this.character,
  });

  final String playerId;
  final String playerName;
  final Character? character;
  final bool isDead;
  final bool hasGhostVote;
  final bool isEvilEasterEgg;
  final bool isStorytellerMode;
  final List<Character> sessionCharacters;
  final void Function() removePlayer;
  final void Function() toggleIsEvilEasterEgg;
  final void Function(Character?) selectPlayerCharacter;

  void _onDeletePlayer(BuildContext context) {
    final t = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          t.deletePlayer(playerName != '' ? playerName : t.player),
          style: const TextStyle(fontFamily: 'Dumbledore'),
        ),
        content: Text(t.deletePlayerAreYouSure),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () {
              removePlayer();
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            child: Text(t.yes),
          )
        ],
      ),
    );
  }

  void _onSelectCharacter(BuildContext context) {
    selectCharacter(
        context,
        character?.team == Team.traveller
            ? characters
                .where((character) => character.team == Team.traveller)
                .toList()
            : sessionCharacters
                .where((character) => character.team != Team.traveller)
                .toList(), (character) {
      if (isEvilEasterEgg) {
        toggleIsEvilEasterEgg();
      }
      selectPlayerCharacter(character);
    }, !isStorytellerMode);
  }

  void _openShowPlayer(BuildContext context) async {
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

  void _openCharacterDetails(BuildContext context) async {
    if (character == null) {
      return;
    }
    if (kIsWeb) {
      launchInWebView(getUrl(character!));
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => CharacterDetailsScreen(
          character: character!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              width: 40,
            ),
            Hero(
              tag: playerId,
              child: Material(
                type: MaterialType.transparency,
                child: Semantics(
                  button: true,
                  label: t.selectCharacter,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => _onSelectCharacter(context),
                    onLongPress: toggleIsEvilEasterEgg,
                    child: Stack(
                      children: [
                        isDead
                            ? ColorFiltered(
                                colorFilter:
                                    const ColorFilter.matrix(greyMatrix),
                                child: CharacterToken(
                                  character: character,
                                  tokenSize: TokenSize.medium,
                                  isEvilEasterEgg: isEvilEasterEgg,
                                ),
                              )
                            : CharacterToken(
                                character: character,
                                tokenSize: TokenSize.medium,
                                isEvilEasterEgg: isEvilEasterEgg,
                              ),
                        if (isDead)
                          const Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: -10,
                            child: Image(
                              image: AssetImage('assets/images/shroud.png'),
                            ),
                          ),
                        if (isDead && hasGhostVote)
                          Positioned(
                            left: 0,
                            right: -30,
                            top: 5,
                            child: Tooltip(
                              message: t.hasGhostVote,
                              child: const GhostVoteToken(
                                  size: kGhostVoteTokenSizeMedium),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () => _onDeletePlayer(context),
                    icon: Icon(
                      Icons.delete_outline,
                      semanticLabel: t.deleteGame,
                    ),
                  ),
                ),
                if (character != null) ...[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () => _openShowPlayer(context),
                      icon: Icon(
                        Icons.visibility_outlined,
                        semanticLabel: '${t.show} ${character!.name}',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () => _openCharacterDetails(context),
                      icon: Icon(
                        Icons.read_more,
                        semanticLabel: '${character!.name} - ${t.details}',
                      ),
                    ),
                  )
                ],
              ],
            ),
          ]),
          if (character != null) ...[
            const SizedBox(
              height: 8,
            ),
            Text(
              character!.ability,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall!.copyWith(height: 1),
            ),
          ]
        ],
      ),
    );
  }
}
