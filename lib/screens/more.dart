import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/layout.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final getTranslationKey = getTranslationKeyGetter(context);
    final width = MediaQuery.of(context).size.width;
    final linksMetadata = getMoreScreensMetadata(width);

    return Layout(
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.more),
          centerTitle: false,
          automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  for (final link in linksMetadata)
                    Semantics(
                      link: true,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => link.screen,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    link.icon,
                                    size: 18,
                                    color: theme.colorScheme.surface,
                                  )),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Transform.translate(
                                  offset: const Offset(0, 16),
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: theme.colorScheme.primary,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          getTranslationKey(link.titleKey),
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        Icon(
                                          Icons.navigate_next_outlined,
                                          color: theme.colorScheme.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
