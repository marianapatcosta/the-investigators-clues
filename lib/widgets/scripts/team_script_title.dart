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
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            getCapitalizedTeamTitle(title),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
