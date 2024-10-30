import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/data/night_order.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/night_order_list.dart';

const double imageSize = 40;
const List<String> defaultOrders = ["DUSK", "DAWN", "MINION", "DEMON"];

class NightOrder extends StatelessWidget {
  const NightOrder({
    super.key,
    required this.characters,
    this.hasHomebrewCharacters = false,
  });

  final List<Character> characters;
  final bool hasHomebrewCharacters;

  List<String> get orderIds {
    return characters.map((character) => character.id).toList()
      ..addAll(defaultOrders);
  }

  List<dynamic> get firstNightOrder {
    final hasFirstNightOrder =
        characters.any((character) => character.firstNight != 0);

    if (hasFirstNightOrder && hasHomebrewCharacters) {
      return characters.where((character) => character.firstNight != 0).toList()
        ..sort((characterA, characterB) =>
            characterA.firstNight!.compareTo(characterB.firstNight!));
    }

    return nightOrder['firstNight']!
        .where((item) => orderIds.contains(item))
        .toList();
  }

  List<dynamic> get otherNightsOrder {
    final hasOtherNightOrder =
        characters.any((character) => character.otherNight != 0);

    if (hasOtherNightOrder && hasHomebrewCharacters) {
      return characters.where((character) => character.otherNight != 0).toList()
        ..sort((a, b) => a.otherNight!.compareTo(b.otherNight!));
    }
    return nightOrder['otherNight']!
        .where((item) => orderIds.contains(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Text(
            t.order,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NightOrderList(title: t.firstNight, order: firstNightOrder),
            const SizedBox(
              width: 16,
            ),
            NightOrderList(title: t.otherNights, order: otherNightsOrder),
          ],
        ),
      ],
    );
  }
}
