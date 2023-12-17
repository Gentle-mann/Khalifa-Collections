import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../colors.dart';

class StepTitle extends StatelessWidget {
  const StepTitle({
    super.key,
    required this.title,
    required this.icon,
    this.isIconLarge = false,
  });
  final String title;
  final String icon;
  final bool isIconLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SvgPicture.asset(
          icon,
          height: isIconLarge ? 20 : 25,
          colorFilter:
              const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
        ),
      ],
    );
  }
}
