import 'package:flutter/material.dart';
import 'package:mlrcc/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    textTheme: TextTheme(),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
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
