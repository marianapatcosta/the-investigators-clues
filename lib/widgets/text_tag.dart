import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    required this.tag,
    required this.deleteTag,
  });

  final String tag;
  final void Function() deleteTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: theme.colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tag,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.surface),
          ),
          const SizedBox(width: 4.0),
          SizedBox(
            height: 36,
            width: 36,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: deleteTag,
              icon: Icon(
                Icons.cancel,
                color: theme.colorScheme.surface,
              ),
            ),
          )
        ],
      ),
    );
  }
}
