import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormActionBar extends StatelessWidget {
  const FormActionBar({
    super.key,
    required this.onSave,
    this.onCancel,
  });

  final void Function() onSave;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              if (onCancel != null) {
                onCancel!();
                return;
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: theme.colorScheme.onSurface,
              minimumSize: const Size(120, 40),
            ),
            icon: const Icon(Icons.close),
            label: Text(t.cancel),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              onSave();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 40),
            ),
            icon: const Icon(Icons.save),
            label: Text(t.save),
          ),
        ),
      ],
    );
  }
}
