import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData.dark().copyWith(
    primaryColor: const Color.fromARGB(31, 19, 18, 18),
    scaffoldBackgroundColor: const Color(0xFF473F97),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF473F97),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.cyanAccent),
  );
}
