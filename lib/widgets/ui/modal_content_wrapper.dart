import 'package:flutter/material.dart';

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

    final titleContent = title != null
        ? Text(
            title!,
            style: theme.textTheme.titleMedium,
          )
        : const SizedBox();

    return Padding(
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
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
                      child: titleContent,
                    ),
                    content,
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 10),
                        alignment: Alignment.center,
                        child: titleContent,
                      ),
                      content,
                    ],
                  ),
                ),
        ));
  }
}
