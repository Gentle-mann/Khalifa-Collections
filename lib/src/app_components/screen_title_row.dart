import 'package:flutter/material.dart';

import '../screens/details/components/action_avatar.dart';
import 'screen_title.dart';

class ScreenTitleRow extends StatelessWidget {
  const ScreenTitleRow({
    super.key,
    required this.title,
    this.shouldAddBackButton = true,
  });
  final String title;
  final bool shouldAddBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: shouldAddBackButton
                ? const ActionAvatar(icon: 'assets/icons/back.svg')
                : const SizedBox.shrink()),
        const SizedBox(
          width: 50,
        ),
        Center(child: ScreenTitle(title)),
      ],
    );
  }
}
