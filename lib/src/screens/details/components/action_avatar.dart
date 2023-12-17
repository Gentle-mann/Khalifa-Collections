import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_setup.dart';

class ActionAvatar extends StatelessWidget {
  const ActionAvatar({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return CircleAvatar(
      radius: rSize * 2,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
