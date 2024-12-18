import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character, Jinx;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show ButtonTab, Jinxes, NightOrderList;

class StorytellerHelper extends StatefulWidget {
  const StorytellerHelper({
    super.key,
    required this.characters,
    required this.inPlayCharactersIds,
    required this.gamePhase,
    required this.alivePlayersCharactersIds,
    required this.alivePlayersWithoutAbilityCharactersIds,
    required this.jinxes,
    required this.showAllCharacters,
    required this.showDeadCharacters,
    required this.toggleShowAllCharacters,
    required this.toggleShowDeadCharacters,
    this.hasHomebrewCharacters = false,
  });

  final List<Character> characters;
  final List<String> inPlayCharactersIds;
  final List<String> alivePlayersCharactersIds;
  final List<String> alivePlayersWithoutAbilityCharactersIds;
  final bool hasHomebrewCharacters;
  final List<Jinx> jinxes;
  final String gamePhase;
  final bool showAllCharacters;
  final bool showDeadCharacters;
  final void Function() toggleShowAllCharacters;
  final void Function() toggleShowDeadCharacters;

  @override
  State<StorytellerHelper> createState() {
    return _StorytellerHelperState();
  }
}

class _StorytellerHelperState extends State<StorytellerHelper> {
  late NightType _nightTab;

  @override
  void initState() {
    super.initState();
    _nightTab = widget.gamePhase == 'N1' || widget.gamePhase == 'D1'
        ? NightType.first
        : NightType.other;
  }

  List<dynamic> get firstNightOrder {
    return getFirstNightOrder(widget.characters, widget.hasHomebrewCharacters);
  }

  List<dynamic> get otherNightsOrder {
    return getOtherNightsOrder(widget.characters, widget.hasHomebrewCharacters);
  }

  List<dynamic> get order {
    if (_nightTab == NightType.first) {
      return getOrder(firstNightOrder);
    }
    return getOrder(otherNightsOrder);
  }

  List<dynamic> getOrder(List<dynamic> unfilteredOrder) {
    if (widget.showAllCharacters) {
      return unfilteredOrder;
    }

    if (widget.showDeadCharacters) {
      return unfilteredOrder.where((order) {
        final orderId = order is Character ? order.id : order;

        return defaultOrders.contains(orderId) ||
            widget.inPlayCharactersIds.contains(orderId);
      }).toList();
    }

    return unfilteredOrder.where((order) {
      final orderId = order is Character ? order.id : order;

      return defaultOrders.contains(orderId) ||
          widget.alivePlayersCharactersIds.contains(orderId);
    }).toList();
  }

  bool _isAliveCharacterWithoutAbility(String orderId) {
    return widget.alivePlayersWithoutAbilityCharactersIds.contains(orderId);
  }

  bool _isNotInPlayOrDeadCharacter(String orderId) {
    return (!defaultOrders.contains(orderId) &&
            !widget.inPlayCharactersIds.contains(orderId)) ||
        (!defaultOrders.contains(orderId) &&
            !widget.alivePlayersCharactersIds.contains(orderId));
  }

  void _toggleNightTab(NightType tab) {
    setState(() {
      _nightTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.75,
      constraints: const BoxConstraints(maxWidth: 500),
      child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 180),
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).appBarTheme.backgroundColor!,
                            Theme.of(context)
                                .appBarTheme
                                .backgroundColor!
                                .withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ImageIcon(
                                  AssetImage("assets/images/fire_lighter.png"),
                                  size: 28,
                                  color: Colors.white),
                              const SizedBox(width: 20),
                              Text(
                                t.storytellerHelper,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Spacer(),
                        Row(
                          children: [
                            ButtonTab(
                              label: t.firstNight,
                              isSelected: _nightTab == NightType.first,
                              onPressed: () => _toggleNightTab(
                                NightType.first,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ButtonTab(
                              label: t.otherNights,
                              isSelected: _nightTab == NightType.other,
                              onPressed: () => _toggleNightTab(
                                NightType.other,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        NightOrderList(
                            order: order,
                            nightType: _nightTab,
                            showItemDescription: true,
                            getIsNotInPlayOrDeadCharacter:
                                _isNotInPlayOrDeadCharacter,
                            getIsAliveCharacterWithoutAbility:
                                _isAliveCharacterWithoutAbility),
                        const SizedBox(
                          height: 12,
                        ),
                        Transform.translate(
                          offset: const Offset(-24, 0),
                          child: CheckboxListTile(
                            title: Text(
                              t.showDeadCharacters,
                              style: theme.textTheme.titleSmall!
                                  .copyWith(height: 1),
                            ),
                            value: widget.showDeadCharacters,
                            controlAffinity: ListTileControlAffinity.leading,
                            visualDensity: const VisualDensity(
                                horizontal: -4.0, vertical: -4.0),
                            onChanged: (bool? newValue) {
                              widget.toggleShowDeadCharacters();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Transform.translate(
                          offset: const Offset(-24, -8),
                          child: CheckboxListTile(
                            title: Text(
                              t.showAllCharacters,
                              style: theme.textTheme.titleSmall!
                                  .copyWith(height: 1),
                            ),
                            value: widget.showAllCharacters,
                            controlAffinity: ListTileControlAffinity.leading,
                            visualDensity: const VisualDensity(
                                horizontal: -4.0, vertical: -4.0),
                            onChanged: (bool? newValue) {
                              widget.toggleShowAllCharacters();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        if (widget.jinxes.isNotEmpty) ...[
                          const Divider(thickness: 1),
                          const SizedBox(
                            height: 6,
                          ),
                          Jinxes(jinxes: widget.jinxes),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
