import 'package:flutter/material.dart';

final kLightTheme = ThemeData(
  colorScheme: const ColorScheme(
      primary: Color(0xFFD34F51),
      primaryVariant: Color(0xFFD34F51),
      secondary: Color(0xFFFDB365),
      secondaryVariant: Color(0xFF116644), // menu bg
      background: Color(0xFFF8F3ED),
      surface: Color(0xFFFAF4F0),
      error: Color(0xEEBA5C4E),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF999999),
      onBackground: Color(0xFF2C1811),
      onError: Colors.white,
      brightness: Brightness.light),
);

final kDarkTheme = ThemeData(
  colorScheme: const ColorScheme(
      primary: Color(0xFF29853A), // 29853A
      primaryVariant: Color(0xFF45CB5E),
      secondary: Color(0xFF40C56A),
      secondaryVariant: Color(0xFF116644), // menu bg
      background: Color(0xFF3F3C4C),
      surface: Color(0xFF707980),
      error: Color(0xEEBA5C4E),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xFFEEEEEE),
      onSurface: Color(0xFFAAAAAA),
      onError: Colors.white,
      brightness: Brightness.dark),
);
