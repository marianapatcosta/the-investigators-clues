import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/jinx.dart.dart';
import 'package:my_botc_notes/widgets/scripts/jinx_item.dart';

class Jinxes extends StatelessWidget {
  const Jinxes({
    super.key,
    required this.jinxes,
  });

  final List<Jinx> jinxes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text('Jinxes', style: theme.textTheme.titleLarge),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            for (final item in jinxes)
              for (final jinx in item.jinx)
                JinxItem(characterId: item.id, jinx: jinx),
          ],
        ),
      ],
    );
  }
}
