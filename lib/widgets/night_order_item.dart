import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/widgets/character_image.dart';

const double imageSize = 40;

class NightOrderItem extends StatelessWidget {
  const NightOrderItem({
    super.key,
    required this.id,
    required this.nightType,
    this.name,
    this.image,
    this.description,
    this.showDescription = false,
    this.isNotInPlayOrDeadCharacter,
    this.isAliveCharacterWithoutAbility,
  });

  final String id;
  final NightType nightType;
  final String? name;
  final String? image;
  final String? description;
  final bool showDescription;
  final bool Function(String orderId)? isNotInPlayOrDeadCharacter;
  final bool Function(String orderId)? isAliveCharacterWithoutAbility;

  Map<String, String> get itemInfo {
    if (id == 'DUSK') {
      return {
        'name': 'Dusk',
        "image": "assets/images/dusk.png",
      };
    }

    if (id == 'DAWN') {
      return {
        'name': 'Dawn',
        "image": "assets/images/dawn.png",
      };
    }
    if (id == 'MINION') {
      return {
        'name': 'Minion setup',
        "image": "assets/images/minion.png",
        "description":
            "Minions learn who each other are and who their demon is.",
      };
    }
    if (id == 'DEMON') {
      return {
        'name': 'Demon setup',
        "image": "assets/images/demon.png",
        "description":
            "Demon learns who are their minions and receives 3 not-in-play characters.",
      };
    }

    if (name != null && image != null && description != null) {
      return {
        'name': name!,
        "image": image!,
        "description": description!,
      };
    }

    return {
      'name': charactersMap[id]!.name,
      "image": charactersMap[id]!.image,
      "description": nightType == NightType.first
          ? charactersMap[id]!.firstNightReminder!
          : charactersMap[id]!.otherNightReminder!,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    return Opacity(
      opacity:
          isNotInPlayOrDeadCharacter != null && isNotInPlayOrDeadCharacter!(id)
              ? 0.6
              : 1,
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: imageSize,
                    height: imageSize,
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
                  Text(itemInfo['name']!, style: theme.textTheme.titleSmall),
                  if (isAliveCharacterWithoutAbility != null &&
                      isAliveCharacterWithoutAbility!(id)) ...[
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
              if (showDescription && itemInfo['description'] != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    itemInfo['description']!,
                    style: theme.textTheme.bodySmall!.copyWith(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
