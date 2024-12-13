import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';

class ModalContentWrapper extends StatelessWidget {
  const ModalContentWrapper({
    super.key,
    this.title,
    required this.content,
    this.isFullScreen = false,
  });

  final String? title;
  final Widget content;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < kBreakpoints[ScreenSize.xs]!;

    final titleContent = title != null
        ? Text(
            title!,
            style: theme.textTheme.titleMedium,
          )
        : const SizedBox();

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 40,
        ),
        titleContent,
        SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                semanticLabel: t.close,
              ),
            )),
      ],
    );

    return Padding(
        padding: EdgeInsets.only(
            top: 16,
            left: isSmallScreen ? 4 : 16,
            right: isSmallScreen ? 4 : 16,
            // to lift the modal up when keyboard is focused
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          width: double.infinity,
          child: isFullScreen
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      child: header,
                    ),
                    content,
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 10),
                        child: header,
                      ),
                      content,
                    ],
                  ),
                ),
        ));
  }
}
