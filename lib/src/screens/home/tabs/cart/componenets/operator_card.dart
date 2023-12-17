import 'package:flutter/material.dart';

import '../../../../../colors.dart';
import '../../../../../size_setup.dart';

class OperatorCard extends StatelessWidget {
  const OperatorCard(
    this.title, {
    super.key,
    required this.isPlus,
  });
  final bool isPlus;
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      alignment: Alignment.center,
      height: rSize * 3,
      width: rSize * 3,
      decoration: BoxDecoration(
        color: isPlus ? AppColors.kPrimaryColor : AppColors.kPostTertiaryColor,
        borderRadius: BorderRadius.circular(rSize * 0.5),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: rSize * 1.5,
          color: isPlus ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
