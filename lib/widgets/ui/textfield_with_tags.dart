import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/ui/text_tag.dart';

const List<String> _textSeparators = [','];
const int kDefaultHelperMaxLines = 4;

class TextfieldWithTags extends StatefulWidget {
  const TextfieldWithTags({
    super.key,
    required this.tags,
    required this.onAddTag,
    required this.onRemoveTag,
    this.helperText,
    this.hintText,
    this.helperMaxLines = kDefaultHelperMaxLines,
  });

  final List<String> tags;
  final void Function(String) onAddTag;
  final void Function(String) onRemoveTag;
  final String? helperText;
  final String? hintText;
  final int? helperMaxLines;

  @override
  State<TextfieldWithTags> createState() {
    return _TextfieldWithTagsState();
  }
}

class _TextfieldWithTagsState extends State<TextfieldWithTags> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showHelperText = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    final TextfieldWithTags(
      :tags,
      :onAddTag,
      :onRemoveTag,
      :helperMaxLines,
      :helperText,
      :hintText
    ) = widget;

    final textField = SizedBox(
      width: isLargeScreen ? width / 2 : width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                helperText: _showHelperText ? helperText : '',
                helperStyle: theme.textTheme.bodySmall!,
                helperMaxLines: helperMaxLines,
                hintText: tags.isEmpty ? hintText : '',
                hintStyle: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              onChanged: (tag) {
                if (tag.split(',').length > 1 &&
                    tag.split(',').every((item) => item.trim().isNotEmpty)) {
                  setState(() {
                    for (final tag in tag.split(',')) {
                      onAddTag(tag.trim());
                    }
                    _controller.clear();
                  });
                }
                if (_textSeparators
                    .any((separator) => tag.endsWith(separator))) {
                  setState(() {
                    onAddTag(tag.substring(0, tag.length - 1).trim());
                    _controller.clear();
                  });
                }
              },
              onSubmitted: (tag) {
                setState(() {
                  onAddTag(tag.trim());
                  _controller.clear();
                  _focusNode.requestFocus();
                });
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Transform.translate(
            offset: const Offset(16, 0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  _showHelperText = !_showHelperText;
                });
              },
              icon: Icon(
                Icons.info,
                size: 20,
                color: theme.colorScheme.primary,
                semanticLabel:
                    _showHelperText ? t.hideHelperText : t.showHelperText,
              ),
            ),
          )
        ],
      ),
    );

    return TextfieldWithTagsWrapper(
      children: [
        isLargeScreen ? Expanded(child: textField) : textField,
        SizedBox(
          width: isLargeScreen ? width / 2 : width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Wrap(
              alignment:
                  isLargeScreen ? WrapAlignment.end : WrapAlignment.start,
              runSpacing: 8,
              spacing: 8,
              children: tags.map(
                (String tag) {
                  return TextTag(
                    tag: tag,
                    deleteTag: () {
                      setState(() {
                        onRemoveTag(tag);
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class TextfieldWithTagsWrapper extends StatelessWidget {
  const TextfieldWithTagsWrapper({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    if (isLargeScreen) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...children,
      ]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...children,
    ]);
  }
}
