import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lighTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple,
    )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
  );
}