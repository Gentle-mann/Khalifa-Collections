import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../colors.dart';
import '../../../size_setup.dart';

class ClothTypeCard extends StatelessWidget {
  const ClothTypeCard(this.index,
      {super.key, required this.icon, required this.title});
  final int index;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(rSize * 1),
          margin: EdgeInsets.all(rSize),
          height: rSize * 5,
          width: rSize * 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kTertiaryColor.withOpacity(0.1),
          ),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.kPrimaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
