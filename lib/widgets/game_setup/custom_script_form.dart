import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/index.dart' show Script;

const int _defaultHelperMaxLines = 2;

class CustomScriptForm extends StatefulWidget {
  const CustomScriptForm({
    super.key,
    required this.onSelectScript,
    this.helperText,
    this.hintText,
    this.helperMaxLines = _defaultHelperMaxLines,
  });

  final void Function(Script?) onSelectScript;
  final String? helperText;
  final String? hintText;
  final int? helperMaxLines;

  @override
  State<CustomScriptForm> createState() {
    return _CustomScriptFormState();
  }
}

class _CustomScriptFormState extends State<CustomScriptForm> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showErrorText = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  void _showHelperDialog(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          t.jsonFormat,
          style: const TextStyle(fontFamily: 'Dumbledore'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.jsonFormatDescription,
              style: const TextStyle(fontFamily: 'Dumbledore'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    '[\n {\n   "id": "chef"\n },\n{\n   "id": "pixie"\n },\n]'),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Text(
                    'OR',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text('[\n "investigator", \n "pixie",\n]'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  void _onValidateScript(String jsonScript) {
    if (_showErrorText) {
      setState(() {
        _showErrorText = false;
      });
    }

    try {
      final jsonArray = json.decode(jsonScript);
      final isJsonFormatValid = jsonArray is List<dynamic> &&
          jsonArray.isNotEmpty &&
          jsonArray.every((item) =>
              (item is Map && item['id'] is String || item is String));

      if (!isJsonFormatValid) {
        setState(() {
          _showErrorText = true;
        });
      }

      final contentFirstItem = jsonArray.first;
      final meta = contentFirstItem['id'] == '_meta' ? contentFirstItem : null;

      final scriptContent = contentFirstItem['id'] == '_meta'
          ? ([...jsonArray]..removeAt(0))
          : jsonArray;
      widget.onSelectScript(Script(
        id: meta != null && meta['pk'] != null && meta['pk'] is int
            ? meta['pk']
            : Random().nextInt(500),
        name: meta != null && meta['name'] != null ? meta['name'] : 'Unknown',
        content: scriptContent,
        almanacUrl:
            meta != null && meta['almanac'] != null ? meta['almanac'] : null,
      ));
    } catch (e) {
      setState(() {
        _showErrorText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final CustomScriptForm(:helperMaxLines, :helperText, :hintText) = widget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.script,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(t.pasteJson),
            const SizedBox(
              width: 8,
            ),
            Transform.translate(
              offset: const Offset(16, 0),
              child: IconButton(
                onPressed: () {
                  _showHelperDialog(context);
                },
                icon: Icon(
                  Icons.info,
                  size: 20,
                  color: theme.colorScheme.primary,
                  semanticLabel: t.showHelperText,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          maxLines: 2,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            isDense: true,
            hintText: '["investigator", "pixie", ...]',
            hintStyle: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
            helperText: _showErrorText ? t.jsonInvalidFormat : null,
            helperMaxLines: _showErrorText ? helperMaxLines : null,
            helperStyle:
                theme.textTheme.bodySmall!.copyWith(color: Colors.red.shade600),
          ),
          onChanged: (jsonScript) {
            _onValidateScript(jsonScript);
          },
          onTapOutside: (PointerDownEvent event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
