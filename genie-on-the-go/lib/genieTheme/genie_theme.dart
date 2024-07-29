import 'package:flutter/material.dart';

class GenieTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black, appBarTheme: const AppBarTheme());

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // scaffoldBackgroundColor: Color.fromARGB(255, 206, 191, 186),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 134, 89, 22),
    ),
  );
}
