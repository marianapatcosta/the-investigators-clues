import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 57, 36, 69),
).copyWith(
    surface: const Color.fromARGB(255, 237, 232, 220),
    primary: const Color.fromARGB(255, 57, 36, 69));

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 38, 9, 51),
);

const kTitleLarge = TextStyle(
  fontFamily: 'Dumbledore',
  fontWeight: FontWeight.normal,
  fontSize: 28,
);

const kTitleMedium = TextStyle(
  fontFamily: 'Dumbledore',
  fontWeight: FontWeight.normal,
  fontSize: 22,
);

const kTitleSmall = TextStyle(
  fontFamily: 'Dumbledore',
  fontWeight: FontWeight.normal,
  fontSize: 18,
);

const kAppBarTitleStyle = TextStyle(
  fontFamily: 'Dumbledore',
  fontWeight: FontWeight.normal,
  fontSize: 24,
);
