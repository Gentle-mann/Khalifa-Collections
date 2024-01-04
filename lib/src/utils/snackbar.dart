import 'package:flutter/material.dart';
import 'package:seed/src/colors.dart';

class ShowSnackBar {
  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.kLightPrimary,
          elevation: 100,
          content: Text(
            message,
            textAlign: TextAlign.center,
            //style: TextStyle(color: Colors.black),
          ),
        ),
      );
  }
}
