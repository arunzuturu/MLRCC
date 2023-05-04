import 'package:flutter/material.dart';
import 'package:mlrcc/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Neue',
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.greenColor,
    ),
  );
}