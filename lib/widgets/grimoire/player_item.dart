import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/player.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/widgets/scripts/character_token.dart';
import 'package:my_botc_notes/screens/edit_player.dart';
import 'package:my_botc_notes/widgets/grimoire/ghost_vote_token.dart';
import 'package:my_botc_notes/widgets/grimoire/player_voted_nominated.dart';

class PlayerItem extends StatefulWidget {
  const PlayerItem({
    super.key,
    required this.player,
    required this.sessionCharacters,
    required this.sessionReminders,
    required this.constraints,
    required this.inPlayCharactersIds,
    required this.isStorytellerMode,
    this.showPlayersNotes = false,
    this.showPlayersVotesNominations = false,
    required this.removePlayer,
    required this.updateParent,
    required this.saveGameSession,
  });

  final Player player;
  final List<Character> sessionCharacters;
  final List<Reminder> sessionReminders;
  final BoxConstraints constraints;
  final List<String> inPlayCharactersIds;
  final bool isStorytellerMode;
  final bool showPlayersNotes;
  final bool showPlayersVotesNominations;
  final void Function() removePlayer;
  final void Function() updateParent;
  final void Function() saveGameSession;

  Character? get character {
    if (player.characterId == null) {
      return null;
    }

    return charactersMap[player.characterId] ??
        sessionCharacters
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
            sessionCharacters: widget.sessionCharacters,
            sessionReminders: widget.sessionReminders,
            removePlayer: widget.removePlayer,
            isStorytellerMode: widget.isStorytellerMode,
            inPlayCharactersIds: widget.inPlayCharactersIds),
      ),
    );

    final wasIsDeadUpdated = updatedPlayer.isDead != widget.player.isDead;
    final wasHasGhostVoteUpdated =
        updatedPlayer.hasGhostVote != widget.player.hasGhostVote;

    final wereRemindersUpdated = widget.isStorytellerMode;

    final updateParent =
        wasIsDeadUpdated || wasHasGhostVoteUpdated || wereRemindersUpdated;

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

    if (wereRemindersUpdated) {
      widget.player.setReminders = updatedPlayer.reminders;
    }

    updateParent ? widget.updateParent() : setState(() {});
    widget.saveGameSession();
  }

  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset(widget.player.x ?? 10, widget.player.y ?? 10);
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
      :isEvilEasterEgg,
      :votedToday,
      :nominatedToday,
    ) = widget.player;

    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isPlayerOnRightSide = _offset.dx > width / 2;
    final double additionalInfoWidth = widget.showPlayersNotes
        ? kPlayerNotesSize
        : (widget.showPlayersVotesNominations ? kPlayerCheckboxesSize : 0);

    return Positioned(
        left:
            isPlayerOnRightSide ? _offset.dx - additionalInfoWidth : _offset.dx,
        top: _offset.dy,
        child: Semantics(
          button: true,
          label: '${t.edit} ${name != '' ? name : t.player}',
          child: GestureDetector(
            onTap: () {
              _openEditPlayer(context);
            },
            onPanUpdate: (details) {
              setState(() {
                double limitX = (_offset.dx + details.delta.dx)
                    .clamp(0,
                        widget.constraints.maxWidth - kCharacterTokenSizeSmall)
                    .toDouble();

                double limitY = (_offset.dy + details.delta.dy)
                    .clamp(0,
                        widget.constraints.maxHeight - kCharacterTokenSizeSmall)
                    .toDouble();

                _offset = Offset(limitX, limitY);
              });
            },
            onPanEnd: (details) {
              widget.player.setX = _offset.dx;
              widget.player.setY = _offset.dy;
              widget.saveGameSession();
            },
            child: SizedBox(
              width: kCharacterTokenSizeSmall + additionalInfoWidth + 2,
              child: Stack(
                children: [
                  Align(
                    alignment: isPlayerOnRightSide
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Column(
                      children: [
                        Hero(
                          tag: id,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Stack(
                              children: [
                                isDead
                                    ? ColorFiltered(
                                        colorFilter: const ColorFilter.matrix(
                                            greyMatrix),
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
                                      image: AssetImage(
                                          'assets/images/shroud.png'),
                                    ),
                                  ),
                                if (isDead && hasGhostVote)
                                  Positioned(
                                    left: 0,
                                    right: -30,
                                    top: 5,
                                    child: Tooltip(
                                      message: t.hasGhostVote,
                                      child: const GhostVoteToken(),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (widget.player.name != '')
                          Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Text(
                                widget.player.name,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  if (widget.showPlayersVotesNominations)
                    Positioned(
                      top: 15,
                      left: isPlayerOnRightSide ? 0 : null,
                      right: isPlayerOnRightSide ? null : 0,
                      child: PlayerVotedNominated(
                        didPlayerVote: votedToday,
                        didPlayerNominate: nominatedToday,
                        onDidPlayerVoteChange: (newValue) {
                          setState(() {
                            widget.player.setVotedToday = newValue ?? false;
                          });
                        },
                        onDidPlayerNominateChange: (newValue) {
                          setState(() {
                            widget.player.setNominatedToday = newValue ?? false;
                          });
                        },
                      ),
                    ),
                  if (widget.showPlayersNotes && notes != '')
                    Align(
                        alignment: isPlayerOnRightSide
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: kPlayerNotesSize,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 4),
                                child: Text(
                                  notes,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                          ),
                        ))
                ],
              ),
            ),
          ),
        ));
  }
}
