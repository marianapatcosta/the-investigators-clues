import 'package:flutter/material.dart';
import 'package:my_botc_notes/utils.dart';

class TeamScriptTitle extends StatelessWidget {
  const TeamScriptTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            getCapitalizedTeamTitle(title),
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: theme.colorScheme.onSurface),
        ),
      ],
    );
  }
}
