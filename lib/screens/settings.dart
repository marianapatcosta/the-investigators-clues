import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/dropdown_item.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/dropdown.dart';
import 'package:my_botc_notes/widgets/layout.dart';
import 'package:my_botc_notes/providers/settings_provider.dart';

const themeDropdownOptions = [
  {'label': 'lightTheme', 'value': ThemeMode.light},
  {'label': 'darkTheme', 'value': ThemeMode.dark},
  {'label': 'systemTheme', 'value': ThemeMode.system},
];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final settings = ref.watch(settingsProvider);
    final getTranslationKey = getTranslationKeyGetter(context);

    return Layout(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
        title: Text(t.settings),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            width: isScreenBiggerThanX(width, ScreenSize.md)
                ? 300
                : double.infinity,
            child: Column(
              children: [
                Dropdown<ThemeMode>(
                  title: t.theme,
                  value: settings.themeMode,
                  items: ThemeMode.values
                      .toList()
                      .map(
                        (themeMode) => DropdownItem<ThemeMode>(
                            label: getTranslationKey(themeMode.name),
                            value: themeMode),
                      )
                      .toList(),
                  onSelect: (value) {
                    ref
                        .read(settingsProvider.notifier)
                        .setTheme(value as ThemeMode);
                  },
                ),
                const SizedBox(height: 20),
                Dropdown<Locale>(
                  title: t.language,
                  value: settings.locale,
                  items: AppLocalizations.supportedLocales
                      .map(
                        (locale) => DropdownItem<Locale>(
                            label: locale.toLanguageTag().toUpperCase(),
                            value: locale),
                      )
                      .toList(),
                  onSelect: (value) {
                    ref
                        .read(settingsProvider.notifier)
                        .setLocale(value as Locale);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
