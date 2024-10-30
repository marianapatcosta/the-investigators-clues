import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/layout.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Layout(
        child: Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline,
                  size: 120, color: theme.colorScheme.primary),
              const SizedBox(
                height: 32,
              ),
              Text(
                t.generalError,
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text(t.goBack),
                icon: const Icon(Icons.arrow_back),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
