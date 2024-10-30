import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/widgets/character_token.dart';
import 'package:my_botc_notes/screens/edit_player.dart';

const List<double> greyMatrix = [
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
];

class PlayerItem extends StatefulWidget {
  const PlayerItem({
    super.key,
    required this.player,
    required this.scriptCharacters,
    required this.constraints,
    required this.removePlayer,
    required this.updateParent,
    required this.saveGameSession,
  });

  final Player player;
  final List<Character> scriptCharacters;
  final BoxConstraints constraints;
  final void Function() removePlayer;
  final void Function() updateParent;
  final void Function() saveGameSession;

  Character? get character {
    if (player.characterId == null) {
      return null;
    }
    return scriptCharacters
        .firstWhere((character) => character.id == player.characterId);
  }

  @override
  State<PlayerItem> createState() {
    return _PlayerItemState();
  }
}

class _PlayerItemState extends State<PlayerItem> {
  void _openEditPlayer(BuildContext context) async {
    Player updatedPlayer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => EditPlayer(
          player: widget.player,
          scriptCharacters: widget.scriptCharacters,
          removePlayer: widget.removePlayer,
        ),
      ),
    );

    final wasIsDeadUpdated = updatedPlayer.isDead != widget.player.isDead;
    final wasHasGhostVoteUpdated =
        updatedPlayer.hasGhostVote != widget.player.hasGhostVote;

    final updateParent = wasIsDeadUpdated || wasHasGhostVoteUpdated;

    if (updatedPlayer.name != widget.player.name) {
      widget.player.setName = updatedPlayer.name;
    }

    if (updatedPlayer.notes != widget.player.notes) {
      widget.player.setNotes = updatedPlayer.notes;
    }

    if (wasIsDeadUpdated) {
      widget.player.setIsDead = updatedPlayer.isDead;
    }

    if (wasHasGhostVoteUpdated) {
      widget.player.setHasGhostVote = updatedPlayer.hasGhostVote;
    }

    if (updatedPlayer.characterId != widget.player.characterId) {
      widget.player.setCharacterId = updatedPlayer.characterId;
    }

    if (updatedPlayer.isEvilEasterEgg != widget.player.isEvilEasterEgg) {
      widget.player.setIsEvilEasterEgg = updatedPlayer.isEvilEasterEgg;
    }

    updateParent ? widget.updateParent() : setState(() {});
    widget.saveGameSession();
  }

  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset(widget.player.x!, widget.player.y!);
  }

  @override
  Widget build(BuildContext context) {
    final Player(
      :id,
      :name,
      :notes,
      :isDead,
      :hasGhostVote,
      :characterId,
      :isEvilEasterEgg
    ) = widget.player;

    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final displayName = name != '' ? name : t.player;

    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Semantics(
        button: true,
        label: '${t.edit} $displayName',
        child: GestureDetector(
          onTap: () {
            _openEditPlayer(context);
          },
          onPanUpdate: (details) {
            setState(() {
              double limitX = (_offset.dx + details.delta.dx)
                  .clamp(
                      0, widget.constraints.maxWidth - kCharacterTokenSmallSize)
                  .toDouble();

              double limitY = (_offset.dy + details.delta.dy)
                  .clamp(0,
                      widget.constraints.maxHeight - kCharacterTokenSmallSize)
                  .toDouble();

              _offset = Offset(limitX, limitY);
            });
          },
          onPanEnd: (details) {
            widget.player.x = _offset.dx;
            widget.player.y = _offset.dy;
            widget.saveGameSession();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Hero(
                    tag: id,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Stack(
                        children: [
                          isDead
                              ? ColorFiltered(
                                  colorFilter:
                                      const ColorFilter.matrix(greyMatrix),
                                  child: CharacterToken(
                                    character: widget.character,
                                    isEvilEasterEgg: isEvilEasterEgg,
                                  ),
                                )
                              : CharacterToken(
                                  character: widget.character,
                                  isEvilEasterEgg: isEvilEasterEgg,
                                ),
                          if (isDead)
                            const Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: Image(
                                image: AssetImage('assets/images/shroud.png'),
                              ),
                            ),
                          if (isDead && hasGhostVote)
                            const Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              child: Image(
                                image:
                                    AssetImage('assets/images/ghost_vote.png'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Text(widget.player.name != ''
                          ? widget.player.name
                          : t.unknown),
                    ),
                  )
                ],
              ),
              if (notes != '')
                const SizedBox(
                  width: 8,
                ),
              if (notes != '')
                SizedBox(
                  width: 60,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Text(
                        notes,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
