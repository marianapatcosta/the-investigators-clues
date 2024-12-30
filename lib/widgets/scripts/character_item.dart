import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/index.dart' show charactersMap;
import 'package:my_botc_notes/models/index.dart' show Character;
import 'package:my_botc_notes/screens/index.dart' show CharacterDetailsScreen;
import 'package:my_botc_notes/widgets/index.dart' show CharacterImage;

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
    this.small,
  });

  final Character character;
  final bool? small;

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.inAppWebView, webOnlyWindowName: '_self')) {
      throw Exception('Could not launch $url');
    }
  }

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
      _launchInWebView(url);
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
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    // Row because ListTile was not adapting its width when using flutter_layout_grid
                    child: Row(
                      children: [
                        Center(
                          child: SizedBox(
                            width: tokenSize,
                            height: tokenSize,
                            child: CharacterImage(
                              name: character.name,
                              image: character.image,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    character.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
                                          name:
                                              charactersMap[jinx['id']!]!.name,
                                          image:
                                              charactersMap[jinx['id']!]!.image,
                                        ),
                                      ),
                                ],
                              ),
                              Text(character.ability),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
