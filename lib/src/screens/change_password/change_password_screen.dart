import 'package:flutter/material.dart';

import '../../app_components/header_text.dart';
import '../../size_setup.dart';
import 'components/change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  static const routeName = '/change_password';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: rSize * 2,
          vertical: rSize * 5,
        ),
        child: Column(
          children: [
            const HeaderText('New Password'),
            const Text(
                'Your new password must be different from your previous one!'),
            SizedBox(height: rSize * 2),
            const ChangePasswordForm(),
          ],
        ),
      ),
    );
  }
}
