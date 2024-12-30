import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/widgets/index.dart' show CharacterItem;

const _kColumnNumber = 2;

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [
        1.fr,
        1.fr,
      ],
      rowSizes: [
        for (int index = 0;
            index < (characters.length / _kColumnNumber).ceil();
            index++)
          auto
      ],
      rowGap: 8,
      columnGap: 8,
      children: [
        for (int index = 0; index < characters.length; index++)
          GridPlacement(
            rowStart: (index / _kColumnNumber).floor(),
            columnStart: index % _kColumnNumber == 0 ? 0 : 1,
            child: CharacterItem(
              character: characters[index],
            ),
          ),
      ],
    );
  }
}
