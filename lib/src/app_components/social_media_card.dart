import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../size_setup.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard(
    this.icon, {
    super.key,
    required this.onTap,
  });
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      height: rSize * 6,
      width: rSize * 6,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.kSecondaryColor),
      ),
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
