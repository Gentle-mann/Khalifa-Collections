import 'package:flutter/material.dart';
import 'package:seed/src/colors.dart';

import 'input_decoration.dart';

class DarkTheme {
  static TextTheme darkTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 32,
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
  DarkTheme._();
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kDarkPrimary,
        primary: AppColors.kDarkPrimary,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return AppColors.kDarkPrimary;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kDarkPrimary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
      ),
      inputDecorationTheme: TextFieldTheme.inputDecorationTheme(),
      scaffoldBackgroundColor: AppColors.kDarkBackground,
    );
  }
}
