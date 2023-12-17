import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../size_setup.dart';

class SizeSelectionCard extends StatelessWidget {
  const SizeSelectionCard({
    super.key,
    this.isSelected = false,
    required this.title,
  });
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      alignment: Alignment.center,
      height: rSize * 3.8,
      padding: EdgeInsets.all(rSize * 0.8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kTertiaryColor),
        borderRadius: BorderRadius.circular(rSize * 0.5),
        color: isSelected ? AppColors.kPrimaryColor : Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
