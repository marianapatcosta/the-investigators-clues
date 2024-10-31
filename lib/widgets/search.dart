import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.searchController,
    this.onChange,
    this.onClear,
    this.onSubmit,
    this.width = 220,
    this.height = 44,
  });

  final TextEditingController searchController;
  final double width;
  final double height;
  final void Function(String inputValue)? onChange;
  final void Function(String inputValue)? onSubmit;
  final void Function()? onClear;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    void handleSubmit(String input) {
      onSubmit!(input);
    }

    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 4),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: theme.colorScheme.primary, width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              maxLength: 20,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                label: Text(t.search),
                icon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                counterText: '',
                contentPadding: const EdgeInsets.only(bottom: 16.0, left: -8),
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onChanged: onChange,
              onSubmitted: handleSubmit,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Visibility(
            visible: searchController.text.trim().isNotEmpty,
            child: const SizedBox(
              width: 4,
            ),
          ),
          Visibility(
            visible: searchController.text.trim().isNotEmpty,
            child: IconButton(
              onPressed: onClear,
              icon: Icon(
                Icons.highlight_off,
                semanticLabel: t.clearSearch,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
