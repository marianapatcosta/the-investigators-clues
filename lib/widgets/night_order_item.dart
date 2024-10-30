import 'package:flutter/material.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/widgets/character_image.dart';

const double imageSize = 40;

class NightOrderItem extends StatelessWidget {
  const NightOrderItem({
    super.key,
    required this.id,
    this.name,
    this.image,
  });

  final String id;
  final String? name;
  final String? image;

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
        'name': 'Minion info',
        "image": "assets/images/minion.png",
      };
    }
    if (id == 'DEMON') {
      return {
        'name': 'Demon info',
        "image": "assets/images/demon.png",
      };
    }

    if (name != null && image != null) {
      return {
        'name': name!,
        "image": image!,
      };
    }

    return {
      'name': charactersMap[id]!.name,
      "image": charactersMap[id]!.image,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
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
        Expanded(
          child: Text(itemInfo['name']!),
        ),
      ],
    );
  }
}
