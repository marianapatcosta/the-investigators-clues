import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart'
    show charactersMap, nightOrderNonCharacterInfo;
import 'package:my_botc_notes/widgets/index.dart' show CharacterImage;

const double _nightOrderImageSize = 40;

class NightOrderItem extends StatelessWidget {
  const NightOrderItem({
    super.key,
    required this.id,
    required this.nightType,
    this.name,
    this.image,
    this.description,
    this.ability,
    this.showDescription = false,
    this.getIsNotInPlayOrDeadCharacter,
    this.getIsAliveCharacterWithoutAbility,
  });

  final String id;
  final NightType nightType;
  final String? name;
  final String? image;
  final String? description;
  final String? ability;
  final bool showDescription;
  final bool Function(String orderId)? getIsNotInPlayOrDeadCharacter;
  final bool Function(String orderId)? getIsAliveCharacterWithoutAbility;

  Map<String, String> get itemInfo {
    final nonCharacterInfo = nightOrderNonCharacterInfo[id];

    if (nonCharacterInfo != null) {
      return {
        'name': nonCharacterInfo.name,
        "image": nonCharacterInfo.image,
        "description": nonCharacterInfo.firstNightReminder ?? '',
      };
    }

    if (name != null && image != null) {
      return {
        'name': name!,
        "image": image!,
        "description": description ?? '',
        "ability": ability ?? ''
      };
    }

    return {
      'name': charactersMap[id]!.name,
      "image": charactersMap[id]!.image,
      "description": nightType == NightType.first
          ? charactersMap[id]!.firstNightReminder!
          : charactersMap[id]!.otherNightReminder!,
      "ability": charactersMap[id]!.ability
    };
  }

  void _onShowCharacter(
    BuildContext context,
  ) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            SizedBox(
              width: _nightOrderImageSize,
              height: _nightOrderImageSize,
              child: CharacterImage(
                name: itemInfo['name']!,
                image: itemInfo['image']!,
                color: itemInfo['name']! == 'Dusk'
                    ? theme.colorScheme.onSurface
                    : null,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              itemInfo['name']!,
              style: const TextStyle(fontFamily: 'Dumbledore'),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OK'))
        ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (itemInfo['description'] != null &&
                itemInfo['description'] != '') ...[
              Text(
                nightType == NightType.first ? t.firstNight : t.otherNights,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                itemInfo['description']!,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
            if (itemInfo['ability'] != null && itemInfo['ability'] != '') ...[
              Text(
                t.ability,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                itemInfo['ability']!,
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    return Opacity(
      opacity: getIsNotInPlayOrDeadCharacter != null &&
              getIsNotInPlayOrDeadCharacter!(id)
          ? 0.6
          : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: _nightOrderImageSize,
                height: _nightOrderImageSize,
                child: CharacterImage(
                  name: itemInfo['name']!,
                  image: itemInfo['image']!,
                  color: itemInfo['name']! == 'Dusk'
                      ? theme.colorScheme.onSurface
                      : null,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              if (showDescription &&
                  itemInfo['ability'] != null &&
                  itemInfo['ability'] != '')
                SizedBox(
                  height: 30,
                  child: TextButton(
                    onPressed: () => _onShowCharacter(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(
                      itemInfo['name']!,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                )
              else
                Text(itemInfo['name']!, style: theme.textTheme.titleSmall),
              if (getIsAliveCharacterWithoutAbility != null &&
                  getIsAliveCharacterWithoutAbility!(id)) ...[
                const SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.warning,
                  size: 20,
                  color: Colors.red.shade600,
                  semanticLabel: t.showSetupWarning,
                ),
                Text(t.noAbility,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: Colors.red.shade600)),
              ],
            ],
          ),
          if (showDescription &&
              itemInfo['description'] != null &&
              itemInfo['description'] != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                itemInfo['description']!,
                style: theme.textTheme.bodySmall!.copyWith(),
              ),
            ),
        ],
      ),
    );
  }
}
