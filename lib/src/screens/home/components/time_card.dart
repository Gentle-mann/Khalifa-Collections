import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../size_setup.dart';

class TimeCard extends StatelessWidget {
  const TimeCard(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      padding: EdgeInsets.all(rSize * 0.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rSize * 0.7),
        color: AppColors.kPrimaryColor.withOpacity(0.3),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
