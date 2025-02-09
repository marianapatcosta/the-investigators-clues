import 'package:flutter/material.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';

class Acknowledgments extends StatelessWidget {
  const Acknowledgments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Blood on the Clocktower',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 1.25,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'bloodontheclocktower.com',
                      ),
                    ),
            ),
            TextSpan(
              text: ' ${t.botcTrademark}',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${t.acknowledgmentsScripts} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'BotC Scripts database',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 1.25,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'botc-scripts.azurewebsites.net',
                      ),
                    ),
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${t.acknowledgmentsCharacters} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Blood on the Clocktower wiki',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 1.25,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'wiki.bloodontheclocktower.com',
                      ),
                    ),
            ),
            TextSpan(
              text: ' ${t.and} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Experimental Characters Almanac',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 1.25,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'drive.google.com',
                        path: 'file/d/1eS5s0ZbQdKP2EwtWMSLHyEmcORf9Ni38',
                      ),
                    ),
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${t.acknowledgmentsIcons} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'BotC Icons',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'github.com',
                        path: 'tomozbot/botc-icons',
                      ),
                    ),
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${t.acknowledgmentsImages} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Clocktower.online',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'clocktower.online',
                      ),
                    ),
            ),
            TextSpan(
              text: ' ${t.and} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Flaticon',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'flaticon.com',
                      ),
                    ),
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${t.acknowledgmentsInfo} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Script.bloodontheclocktower',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'script.bloodontheclocktower',
                      ),
                    ),
            ),
            TextSpan(
                text: ', ',
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.25)),
            TextSpan(
              text: 'BotC Tools',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'github.com',
                        path: 'ratteler50/botc_tools',
                      ),
                    ),
            ),
            TextSpan(
              text: ' ${t.and} ',
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
            ),
            TextSpan(
              text: 'Pocket Grimoire',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.25),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchInWebView(
                      Uri(
                        scheme: 'https',
                        host: 'pocketgrimoire.co.uk',
                      ),
                    ),
            ),
            TextSpan(
                text: '.',
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.25)),
          ],
        ),
      ),
    ]);
  }
}
