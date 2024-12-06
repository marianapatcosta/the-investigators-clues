import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:my_botc_notes/providers/favorite_scripts_provider.dart';
import 'package:my_botc_notes/screens/script_details.dart';

class ScriptItem extends ConsumerWidget {
  const ScriptItem({
    super.key,
    required this.script,
    this.isLoading = false,
  });

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
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final isFavorite = ref
        .watch(favoriteScriptsProvider)
        .where((favScript) => favScript.id == script.id)
        .isNotEmpty;

    final canNotBeRemovedFromFavorites = kInitialFavoriteScripts
        .where((favScript) => favScript.id == script.id)
        .isNotEmpty;

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
              trailing: canNotBeRemovedFromFavorites
                  ? null
                  : IconButton(
                      onPressed: canNotBeRemovedFromFavorites
                          ? null
                          : () {
                              ref
                                  .read(favoriteScriptsProvider.notifier)
                                  .toggleScriptFavoriteStatus(context, script);

                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isFavorite
                                      ? t.scriptRemovedFromFavorites(
                                          script.name)
                                      : t.scriptAddedToFavorites(script.name)),
                                ),
                              );
                            },
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return RotationTransition(
                            turns: Tween<double>(begin: 0.5, end: 1)
                                .animate(animation),
                            child: child,
                          );
                        },
                        key: ValueKey(isFavorite),
                        child: isFavorite
                            ? Icon(
                                Icons.star,
                                semanticLabel: t.removeFromFavorites,
                              )
                            : Icon(Icons.star_border,
                                semanticLabel: t.addToFavorites),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
