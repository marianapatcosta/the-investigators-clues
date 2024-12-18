import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/widgets/index.dart' show NightOrderItem;

class NightOrderList extends StatelessWidget {
  const NightOrderList({
    super.key,
    this.title,
    required this.order,
    required this.nightType,
    this.showItemDescription = false,
    this.getIsNotInPlayOrDeadCharacter,
    this.getIsAliveCharacterWithoutAbility,
  });

  final String? title;
  final List<dynamic> order;
  final NightType nightType;
  final bool showItemDescription;
  final bool Function(String orderId)? getIsNotInPlayOrDeadCharacter;
  final bool Function(String orderId)? getIsAliveCharacterWithoutAbility;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title!, style: theme.textTheme.titleLarge),
          const SizedBox(
            height: 8,
          ),
        ],
        for (final item in order)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: NightOrderItem(
              id: item is Character ? item.id : item,
              name: item is Character ? item.name : null,
              image: item is Character ? item.image : null,
              description: item is Character
                  ? (nightType == NightType.first
                      ? item.firstNightReminder
                      : item.otherNightReminder)
                  : null,
              ability: item is Character ? item.ability : null,
              nightType: nightType,
              showDescription: showItemDescription,
              getIsNotInPlayOrDeadCharacter: getIsNotInPlayOrDeadCharacter,
              getIsAliveCharacterWithoutAbility:
                  getIsAliveCharacterWithoutAbility,
            ),
          ),
      ],
    );
  }
}
