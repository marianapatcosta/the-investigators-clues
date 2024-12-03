import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/ui/layout.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';

class AcknowledgmentsScreen extends StatelessWidget {
  const AcknowledgmentsScreen({
    super.key,
  });

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.inAppWebView, webOnlyWindowName: '_self')) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Layout(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
          title: Text(t.acknowledgments),
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'bloodontheclocktower.com',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: ' ${t.botcTrademark}',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'botc-scripts.azurewebsites.net',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: '.',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'wiki.bloodontheclocktower.com',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: '.',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Clocktower.online',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'clocktower.online',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: ' ${t.and} ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Pocket Grimoire',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'pocketgrimoire.co.uk',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: '. (',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: '${t.source}: ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Font Awesome',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                        scheme: 'https',
                                        host: 'fontawesome.com',
                                        path: 'v5/search'),
                                  ),
                          ),
                          TextSpan(
                            text: ').',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Clocktower.online',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'clocktower.online',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: ' ${t.and} ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Flaticon',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'flaticon.com',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: '.',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Clocktower.online',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'clocktower.online',
                                    ),
                                  ),
                          ),
                          TextSpan(
                            text: ' ${t.and} ',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: 'Pocket Grimoire',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                height: 1.25),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchInWebView(
                                    Uri(
                                      scheme: 'https',
                                      host: 'pocketgrimoire.co.uk',
                                    ),
                                  ),
                          ),
                          TextSpan(
                              text: '.',
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(height: 1.25)),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
