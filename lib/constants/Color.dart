import 'package:flutter/material.dart';

class AppThemes {
  static const primary = Colors.blue;
  static const white = Colors.white;
  static const black = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      background: white,
      onSurface: black,
      surface: white,
      shadow: primary,
      primaryContainer: primary,
      onPrimaryContainer: Colors.white,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: black,
      background: black,
      onSurface: white,
      surface: black,
      shadow: white,
      primaryContainer: primary,
      onPrimaryContainer: white,
    ),
    useMaterial3: true,
  );
}
