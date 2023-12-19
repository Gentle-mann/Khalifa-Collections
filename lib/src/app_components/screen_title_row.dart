import 'package:flutter/material.dart';

import '../screens/details/components/action_avatar.dart';
import 'screen_title.dart';

class ScreenTitleRow extends StatelessWidget {
  const ScreenTitleRow({
    super.key,
    required this.title,
    this.shouldAddFav = false,
  });
  final String title;
  final bool shouldAddFav;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              //Navigator.of(context).pop();
            },
            child: const ActionAvatar(icon: 'assets/icons/back.svg')),
        ScreenTitle(title),
        shouldAddFav
            ? const ActionAvatar(icon: 'assets/icons/heart.svg')
            : const SizedBox.shrink(),
      ],
    );
  }
}
