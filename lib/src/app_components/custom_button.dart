import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/auth_provider.dart';

import '../colors.dart';
import '../size_setup.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
  });
  final String title;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: rSize, vertical: rSize * 1.2),
            backgroundColor: color != null
                ? AppColors.kPostTertiaryColor
                : AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rSize * 3),
            ),
          ),
          onPressed: onPressed,
          child: authProvider.isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: rSize * 2,
                    fontWeight: FontWeight.w500,
                    color: color != null
                        ? AppColors.kPrimaryColor
                        : AppColors.kPostTertiaryColor,
                  ),
                ),
        ),
      );
    });
  }
}
