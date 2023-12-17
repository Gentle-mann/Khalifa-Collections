import 'package:flutter/material.dart';

import '../colors.dart';

class TextFieldTheme {
  static InputDecorationTheme inputDecorationTheme() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: AppColors.kSecondaryColor),
    );
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      hintStyle: const TextStyle(fontSize: 16),
      //labelStyle: LightTextTheme.lightTextTheme.displaySmall,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

  static InputDecoration otpFieldTheme() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: AppColors.kSecondaryColor,
      ),
    );

    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        enabledBorder: border,
        focusedBorder: border,
        border: border);
  }
}
