import 'package:flutter/material.dart';

class Themes {
  static ThemeData appLightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.copyWith(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      bodySmall: const TextStyle(color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black),
      titleMedium: const TextStyle(color: Colors.black),
    ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
  static ThemeData appDarkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white),
      bodySmall: const TextStyle(color: Colors.white),
      titleLarge: const TextStyle(color: Colors.white),
      titleMedium: const TextStyle(color: Colors.white),
    ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
