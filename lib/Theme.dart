import 'package:flutter/material.dart';

class AppTheme {
  static Color get accentColor => Colors.blue[900]!;
  static Color get hoverAccentColor => Colors.blueAccent;
  static ThemeData get lightTheme {
    return ThemeData(
      highlightColor: Colors.black.withOpacity(0.1),
      splashColor: Colors.black.withOpacity(0.1),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color.fromARGB(255, 219, 219, 219),
        selectionHandleColor: Colors.black,
      ),
      primaryColor: Colors.white,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarTextStyle: TextStyle(color: Colors.white)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
