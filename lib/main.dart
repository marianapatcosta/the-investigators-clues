import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/providers/settings_provider.dart';
import 'package:my_botc_notes/screens/general_error.dart';
import 'package:my_botc_notes/screens/tabs.dart';
import 'package:my_botc_notes/styles.dart';

void main() async {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      builder: (context, widget) {
        Widget error = const GeneralErrorScreen();

        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw StateError('widget is null');
      },
      title: 'The Investigator\'s Clues',
      home: const TabsScreen(),
      locale: settings.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kDarkColorScheme.surface,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          titleTextStyle: kAppBarTitleStyle.apply(
            color: kDarkColorScheme.onSurface,
          ),
          backgroundColor: kDarkColorScheme.surfaceContainer,
          foregroundColor: kDarkColorScheme.onSurface,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.surfaceContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: kDarkColorScheme.surfaceContainer,
          selectedColor: kDarkColorScheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primary,
              foregroundColor: kDarkColorScheme.surface,
              minimumSize: const Size(100, 40),
              textStyle: const TextStyle(
                fontFamily: 'Dumbledore',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: kDarkColorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              )),
        ),
        tabBarTheme: const TabBarTheme().copyWith(
          labelColor: kDarkColorScheme.primary,
          indicatorColor: kDarkColorScheme.primary,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              fontFamily: 'TradeGothic',
              bodyColor: kDarkColorScheme.onSurface,
              displayColor: kDarkColorScheme.onSurface,
            )
            .copyWith(
              bodyMedium:
                  TextStyle(fontSize: 14, color: kDarkColorScheme.onSurface),
              titleSmall: kTitleSmall.apply(color: kDarkColorScheme.onSurface),
              titleMedium:
                  kTitleMedium.apply(color: kDarkColorScheme.onSurface),
              titleLarge: kTitleLarge.apply(color: kDarkColorScheme.onSurface),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.surface,
        appBarTheme: const AppBarTheme().copyWith(
          titleTextStyle: kAppBarTitleStyle.apply(
            color: kColorScheme.onPrimary,
          ),
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onSurface,
          iconTheme: const IconThemeData().copyWith(
            color: kColorScheme.onSecondary,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onPrimary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: kColorScheme.secondary,
          selectedColor: kDarkColorScheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme.onPrimary,
              minimumSize: const Size(100, 40),
              textStyle: const TextStyle(
                fontFamily: 'Dumbledore',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: kColorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              )),
        ),
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              fontFamily: 'TradeGothic',
              bodyColor: kColorScheme.onSurface,
              displayColor: kColorScheme.onSurface,
            )
            .copyWith(
              bodyMedium:
                  TextStyle(fontSize: 14, color: kColorScheme.onSurface),
              titleSmall: kTitleSmall.apply(color: kColorScheme.onSurface),
              titleMedium: kTitleMedium.apply(color: kColorScheme.onSurface),
              titleLarge: kTitleLarge.apply(color: kColorScheme.onSurface),
            ),
      ),
      themeMode: settings.themeMode,
    );
  }
}
