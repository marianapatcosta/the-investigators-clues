import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show Acknowledgments, Layout;
import 'package:my_botc_notes/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    final subFeature1 = [
      t.feature1a,
      t.feature1b,
      t.feature1c,
      t.feature1d,
      t.feature1e,
      t.feature1f,
      t.feature1g,
      t.feature1h,
      t.feature1i,
      t.feature1j,
      t.feature1k,
      t.feature1l,
    ];

    return Layout(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
          title: Text(
            t.about,
            textAlign: TextAlign.start,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'The Investigator\'s Clues ',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, height: 1.25),
                    ),
                    TextSpan(
                      text: t.aboutApp,
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
                      text: t.aboutAppCode,
                      style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
                    ),
                    TextSpan(
                      text: 'GitHub',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchInWebView(
                              Uri(
                                  scheme: 'https',
                                  host: 'github.com',
                                  path:
                                      'marianapatcosta/the-investigators-clues'),
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
              const SizedBox(height: 32),
              Text(
                t.features,
                style: theme.textTheme.titleMedium!.copyWith(height: 1.25),
              ),
              const SizedBox(height: 16),
              Text(
                '‣  ${t.feature1}',
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
              ),
              for (final subFeature in subFeature1)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      ' - ',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        subFeature,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '‣  ',
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: t.feature2a,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          ),
                          TextSpan(
                            text: ' Blood on the Clocktower wiki',
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
                            text: t.feature2b,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.25),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '‣  ',
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: t.feature3,
                          style:
                              theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                        ),
                        TextSpan(
                          text: ' Blood on the Clocktower wiki',
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
                          text: '.',
                          style:
                              theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                t.acknowledgments,
                style: theme.textTheme.titleMedium!.copyWith(height: 1.25),
              ),
              const SizedBox(
                height: 16,
              ),
              const Acknowledgments()
            ]),
          ),
        ),
      ),
    );
  }
}
