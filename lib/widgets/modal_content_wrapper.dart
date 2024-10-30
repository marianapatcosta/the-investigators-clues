import 'package:flutter/material.dart';

class ModalContentWrapper extends StatelessWidget {
  const ModalContentWrapper(
      {super.key,
      this.title,
      required this.content,
      this.isFullScreen = false});

  final String? title;
  final Widget content;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleContent = title != null
        ? Text(
            title!,
            style: theme.textTheme.titleMedium,
          )
        : const SizedBox();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: isFullScreen
              ? Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      child: titleContent,
                    ),
                    content,
                  ],
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      child: titleContent,
                    ),
                    content,
                  ],
                ),
        ));
  }
}
