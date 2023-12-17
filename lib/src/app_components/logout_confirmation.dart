import 'package:flutter/material.dart';

import '../size_setup.dart';
import 'app_components.dart';

class SignOutConfirmation extends StatelessWidget {
  const SignOutConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      height: SizeSetup.height! * 0.25,
      padding: EdgeInsets.only(
        top: rSize * 4,
        right: rSize * 2,
        left: rSize * 2,
        bottom: rSize,
      ),
      child: const Column(
        children: [
          StandardBoldText('Sign Out'),
          Divider(),
          Text('Are you sure you want to sign out?'),
        ],
      ),
    );
  }
}
