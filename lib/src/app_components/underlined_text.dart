import 'package:flutter/material.dart';

import '../colors.dart';

class UnderlinedText extends StatelessWidget {
  const UnderlinedText(
    this.title, {
    super.key,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
