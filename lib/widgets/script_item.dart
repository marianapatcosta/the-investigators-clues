import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/screens/script_details.dart';

class ScriptItem extends StatelessWidget {
  const ScriptItem({super.key, required this.script, this.isLoading = false});

  final Script script;
  final bool? isLoading;

  void onSelectScript(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ScriptDetailsScreen(
          script: script,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Semantics(
          button: true,
          label: '${t.select} ${script.name}',
          child: InkWell(
            onTap: () => onSelectScript(context),
            child: ListTile(
              title: Hero(
                tag: script.id,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    script.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              subtitle: script.author != null
                  ? Text(
                      script.author!,
                    )
                  : null,
              trailing: script.isOfficial
                  ? const Icon(Icons.workspace_premium)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
