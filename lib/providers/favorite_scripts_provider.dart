import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/script.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kFavoriteScripts = 'favorite-scripts';
const kMaxCachedScripts = 5;

class FavoriteScriptsNotifier extends Notifier<List<Script>> {
  @override
  List<Script> build() {
    fetchFavoriteScripts();
    return kInitialFavoriteScripts;
  }

  Future<void> fetchFavoriteScripts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final favoriteScriptsString = preferences.getString(kFavoriteScripts);

    if (favoriteScriptsString != null) {
      final cachedScripts = List.from(jsonDecode(favoriteScriptsString))
          .map((item) => Script.fromJson(item))
          .toList();

      state = [...kInitialFavoriteScripts, ...cachedScripts];
    }
  }

  void toggleScriptFavoriteStatus(BuildContext context, Script script) {
    final isScriptFavorite = state.contains(script);
    final codeSavedScriptsIds =
        kInitialFavoriteScripts.map((script) => script.id);
    final cachedScripts =
        state.where((script) => !codeSavedScriptsIds.contains(script.id));

    if (isScriptFavorite) {
      final updatedCachedScripts = cachedScripts
          .where((favScript) => favScript.id != script.id)
          .toList();
      state = [...kInitialFavoriteScripts, ...updatedCachedScripts];
      saveState(updatedCachedScripts);
    } else {
      if (cachedScripts.length >= kMaxCachedScripts) {
        final t = AppLocalizations.of(context);
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              t.tooManyScripts,
              style: const TextStyle(fontFamily: 'Dumbledore'),
            ),
            content: Text(t.tooManyScriptsDescription(kMaxCachedScripts)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('OK'))
            ],
          ),
        );
        return;
      }
      state = [...state, script];
    }
    saveState([...cachedScripts, script]);
  }

  void saveState(List<Script> scriptsToCache) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(
      kFavoriteScripts,
      jsonEncode(
        scriptsToCache.map((script) => script.toJson()).toList(),
      ),
    );
  }
}

final favoriteScriptsProvider =
    NotifierProvider<FavoriteScriptsNotifier, List<Script>>(
        FavoriteScriptsNotifier.new);
