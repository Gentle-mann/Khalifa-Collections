import 'package:flutter/material.dart';
import '../colors.dart';
import 'input_decoration.dart';

class LightTheme {
  static TextTheme lightTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
    ),
    displayLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  LightTheme._();
  static ThemeData lightTheme() {
    return ThemeData(
      typography: Typography.material2021(white: lightTextTheme),
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      useMaterial3: true,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return AppColors.kPrimaryColor;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
      ),
      //textTheme: LightTextTheme.lightTextTheme,
      inputDecorationTheme: TextFieldTheme.inputDecorationTheme(),
      scaffoldBackgroundColor: AppColors.kLightBackground,
    );
  }
}
