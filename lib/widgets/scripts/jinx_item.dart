import 'package:flutter/material.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/widgets/scripts/character_image.dart';

const double imageSize = 40;

class JinxItem extends StatelessWidget {
  const JinxItem({
    super.key,
    required this.characterId,
    required this.jinx,
  });

  final String characterId;
  final Map<String, String> jinx;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: CharacterImage(
              name: charactersMap[characterId]!.name,
              image: charactersMap[characterId]!.image,
            ),
          ),
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: CharacterImage(
              name: charactersMap[jinx['id']]!.name,
              image: charactersMap[jinx['id']]!.image,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Text(
            jinx['reason']!,
            style: Theme.of(context).textTheme.bodyMedium,
          )),
        ],
      ),
    );
  }
}
