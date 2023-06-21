import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF473F97),
    //textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //    .apply(bodyColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF473F97),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromARGB(255, 120, 137, 235),
      colorScheme: ColorScheme(
        background: Color.fromARGB(255, 34, 42, 87),
        brightness: Brightness.dark,
        error: Color.fromARGB(255, 236, 33, 33),
        onBackground: Color.fromARGB(255, 236, 33, 33),
        onError: Color.fromARGB(255, 236, 33, 33),
        onPrimary: Color.fromARGB(255, 236, 33, 33),
        onSecondary: Color.fromARGB(255, 236, 33, 33),
        onSurface: Color.fromARGB(255, 236, 33, 33),
        primary: Color.fromARGB(255, 236, 33, 33),
        secondary: Color.fromARGB(255, 236, 33, 33),
        surface: Color.fromARGB(255, 236, 33, 33),
      ),
    ),
    cardTheme: CardTheme(
      color: Color.fromARGB(255, 41, 173, 230),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: Color.fromARGB(255, 126, 143, 243),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.cyanAccent),
  );
}
