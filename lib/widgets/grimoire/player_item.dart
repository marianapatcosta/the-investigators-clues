import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart'
    show Character, Player, Reminder, Team;
import 'package:my_botc_notes/providers/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharacterToken, GhostVoteToken, PlayerVotingPhase;
import 'package:my_botc_notes/screens/index.dart'
    show EditPlayer, EditPlayerData;

class PlayerItem extends ConsumerStatefulWidget {
  const PlayerItem({
    super.key,
    required this.player,
    required this.sessionCharacters,
    required this.sessionReminders,
    required this.inPlayCharactersIds,
    required this.isStorytellerMode,
    this.firstNightOrder,
    this.otherNightsOrder,
    required this.removePlayer,
    required this.updateParent,
    required this.saveGameSession,
    required this.addReminders,
  });

  final Player player;
  final List<Character> sessionCharacters;
  final List<Reminder> sessionReminders;
  final List<String> inPlayCharactersIds;
  final bool isStorytellerMode;
  final int? firstNightOrder;
  final int? otherNightsOrder;
  final void Function() removePlayer;
  final void Function() updateParent;
  final void Function() saveGameSession;
  final void Function(List<Reminder>) addReminders;

  Character? get character {
    if (player.characterId == null) {
      return null;
    }

    return charactersMap[player.characterId] ??
        sessionCharacters
            .firstWhere((character) => character.id == player.characterId);
  }

  @override
  ConsumerState<PlayerItem> createState() {
    return _PlayerItemState();
  }
}

class _PlayerItemState extends ConsumerState<PlayerItem> {
  void _openEditPlayer(BuildContext context) async {
    final EditPlayerData editPlayerData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => EditPlayer(
          player: widget.player,
          sessionCharacters: widget.sessionCharacters,
          sessionReminders: widget.sessionReminders,
          removePlayer: widget.removePlayer,
          isStorytellerMode: widget.isStorytellerMode,
          inPlayCharactersIds: widget.inPlayCharactersIds,
        ),
      ),
    );

    final EditPlayerData(:updatedPlayer, :reminders) = editPlayerData;

    final wasCharacterUpdated =
        updatedPlayer.characterId != widget.player.characterId;
    final wasIsDeadUpdated = updatedPlayer.isDead != widget.player.isDead;
    final wasHasGhostVoteUpdated =
        updatedPlayer.hasGhostVote != widget.player.hasGhostVote;

    final wereRemindersUpdated = reminders.isNotEmpty;

    final updateParent = wasIsDeadUpdated ||
        wasHasGhostVoteUpdated ||
        wereRemindersUpdated ||
        (widget.isStorytellerMode && wasCharacterUpdated);

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

    if (wasCharacterUpdated) {
      widget.player.setCharacterId = updatedPlayer.characterId;
    }

    if (updatedPlayer.isEvilEasterEgg != widget.player.isEvilEasterEgg) {
      widget.player.setIsEvilEasterEgg = updatedPlayer.isEvilEasterEgg;
    }

    if (wereRemindersUpdated) {
      widget.addReminders(reminders);
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
      :wasNominatedToday
    ) = widget.player;

    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final grimoireSize = getGrimoireSize(context);

    final isPlayerOnRightSide = _offset.dx > grimoireSize.width / 2;
    final settings = ref.watch(settingsProvider);

    final double additionalInfoWidth = settings.showPlayersNotes
        ? kPlayerNotesSize + 2
        : (settings.showVotingPhase ? kPlayerCheckboxesSize : 0) + 2;

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
                    .clamp(0, grimoireSize.width - kCharacterTokenSizeSmall)
                    .toDouble();

                double limitY = (_offset.dy + details.delta.dy)
                    .clamp(0, grimoireSize.height - kCharacterTokenSizeSmall)
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
                          child: Transform.scale(
                            scale: settings.playerTokenScale,
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
                                  if (characterId != null &&
                                      (widget.firstNightOrder != null ||
                                          widget.firstNightOrder != null))
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (widget.firstNightOrder != null)
                                              _NightOrderIndicator(
                                                  value: widget.firstNightOrder
                                                      .toString(),
                                                  color: teamsColors[Team
                                                      .townsfolk]! as Color),
                                            if (widget.otherNightsOrder != null)
                                              _NightOrderIndicator(
                                                  value: widget.otherNightsOrder
                                                      .toString(),
                                                  color:
                                                      teamsColors[Team.demon]!
                                                          as Color),
                                          ],
                                        ),
                                      ),
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
                  if (settings.showVotingPhase)
                    Transform.scale(
                      scale: settings.playerTokenScale,
                      child: Align(
                        alignment: isPlayerOnRightSide
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: PlayerVotingPhase(
                          didPlayerVote: votedToday,
                          didPlayerNominate: nominatedToday,
                          wasPlayerNominate: wasNominatedToday,
                          onDidPlayerVoteChange: (newValue) {
                            setState(() {
                              widget.player.setVotedToday = newValue ?? false;
                            });
                          },
                          onDidPlayerNominateChange: (newValue) {
                            setState(() {
                              widget.player.setNominatedToday =
                                  newValue ?? false;
                            });
                          },
                          onWasPlayerNominatedChange: (newValue) {
                            setState(() {
                              widget.player.setWasNominatedToday =
                                  newValue ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  if (settings.showPlayersNotes && notes != '')
                    Transform.scale(
                      scale: settings.playerTokenScale,
                      child: Align(
                          alignment: isPlayerOnRightSide
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: kPlayerNotesSize,
                            ),
                            child: Align(
                              alignment: isPlayerOnRightSide
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
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
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}

class _NightOrderIndicator extends StatelessWidget {
  const _NightOrderIndicator({
    super.key,
    required this.value,
    required this.color,
  });

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        gradient: LinearGradient(colors: [
          color,
          color.withOpacity(0.75),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      padding: const EdgeInsets.all(2),
      child: Center(
        child: Text(
          value,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: true,
            applyHeightToLastDescent: false,
          ),
          style: theme.textTheme.bodySmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
