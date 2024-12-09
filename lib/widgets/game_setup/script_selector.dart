import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show DropdownItem, Script;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CustomScriptForm, DropdownSearch;

class ScriptSelector extends StatefulWidget {
  const ScriptSelector({
    super.key,
    required this.selectedScript,
    required this.favoriteScripts,
    required this.onSelectScript,
  });

  final Script? selectedScript;
  final List<Script> favoriteScripts;
  final void Function(Script?) onSelectScript;

  @override
  State<ScriptSelector> createState() {
    return _ScriptSelectorState();
  }
}

class _ScriptSelectorState extends State<ScriptSelector> {
  bool _addCustomScript = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _addCustomScript
            ? CustomScriptForm(onSelectScript: (script) {
                widget.onSelectScript(script);
              })
            : DropdownSearch<Script>(
                width: isLargeScreen ? width / 2 : width,
                menuHeight: height / 2,
                title: t.script,
                hintText: t.selectScript,
                initialValue: widget.selectedScript,
                items: widget.favoriteScripts
                    .map(
                      (script) => DropdownItem(
                        label: script.name,
                        value: script,
                      ),
                    )
                    .toList(),
                onSelect: (script) {
                  FocusScope.of(context).unfocus();
                  widget.onSelectScript(script);
                },
              ),
        TextButton(
          onPressed: () {
            setState(() {
              widget.onSelectScript(null);
              _addCustomScript = !_addCustomScript;
            });
          },
          child: Text(
            _addCustomScript ? t.addExistingScript : t.addCustomScript,
            style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
