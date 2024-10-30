import 'package:flutter/material.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/night_order_item.dart';

class NightOrderList extends StatelessWidget {
  const NightOrderList({
    super.key,
    required this.title,
    required this.order,
  });

  final String title;
  final List<dynamic> order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(
            height: 8,
          ),
          for (final item in order)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: NightOrderItem(
                id: item is Character ? item.id : item,
                name: item is Character ? item.name : null,
                image: item is Character ? item.image : null,
              ),
            ),
        ],
      ),
    );
  }
}
