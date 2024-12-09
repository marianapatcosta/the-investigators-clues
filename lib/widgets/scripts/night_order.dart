import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show NightOrderList;

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
    return getFirstNightOrder(characters, hasHomebrewCharacters);
  }

  List<dynamic> get otherNightsOrder {
    return getOtherNightsOrder(characters, hasHomebrewCharacters);
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: NightOrderList(
                title: t.firstNight,
                order: firstNightOrder,
                nightType: NightType.first,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: NightOrderList(
                  title: t.otherNights,
                  order: otherNightsOrder,
                  nightType: NightType.other),
            ),
          ],
        ),
      ],
    );
  }
}
