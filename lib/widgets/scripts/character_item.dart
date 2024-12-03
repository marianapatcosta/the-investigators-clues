import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/screens/character_details.dart';
import 'package:my_botc_notes/widgets/scripts/character_image.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
    this.small,
  });

  final Character character;
  final bool? small;

  void onSelectCharacter(BuildContext context) async {
    if (kIsWeb) {
      final [scheme, host] = botcWikiUrl.split('://');
      Uri url = Uri(
        scheme: scheme,
        host: host,
        path: character.name,
      );
      if (character.characterInfoUrl != null) {
        final [scheme, urlWithoutScheme] =
            character.characterInfoUrl!.split('://');

        final [host, ...rest] = urlWithoutScheme.split('/');
        final [path, query] = rest.join('/').split('#');

        url = Uri(scheme: scheme, host: host, path: path, query: query);
      }
      if (!await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
        webOnlyWindowName: '_self',
      )) {
        throw Exception('Could not launch $url');
      }
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => CharacterDetailsScreen(
          character: character,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double tokenSize = small == true ? 50 : 75;
    final t = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Semantics(
          link: kIsWeb,
          button: !kIsWeb,
          label: '${t.select} ${character.name}',
          child: InkWell(
            onTap: () => onSelectCharacter(context),
            child: Hero(
              tag: character.id,
              child: Material(
                type: MaterialType.transparency,
                child: ListTile(
                  title: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: Row(
                      children: [
                        Text(
                          character.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (character.jinxes != null &&
                            character.jinxes!.jinx.isNotEmpty)
                          for (final jinx in character.jinxes!.jinx)
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: CharacterImage(
                                name: charactersMap[jinx['id']!]!.name,
                                image: charactersMap[jinx['id']!]!.image,
                              ),
                            ),
                      ],
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                  ),
                  subtitle: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: Text(character.ability),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: tokenSize,
                      height: tokenSize,
                      child: CharacterImage(
                        name: character.name,
                        image: character.image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
