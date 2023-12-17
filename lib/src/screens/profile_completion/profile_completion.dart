import 'package:flutter/material.dart';

import '../../app_components/header_text.dart';
import '../../colors.dart';
import '../../size_setup.dart';
import 'components/profile_completion_form.dart';

class ProfileCompletionScreen extends StatelessWidget {
  const ProfileCompletionScreen({super.key});
  static const routeName = '/complete_profile';

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
            const HeaderText('Complete Profile'),
            const Text('Don\'t worry, only you can see your personal data.'),
            SizedBox(height: rSize * 3),
            Container(
              height: rSize * 8,
              width: rSize * 8,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kTertiaryColor,
              ),
              child: Image.asset('assets/images/person.png'),
            ),
            const ProfileCompletionForm(),
          ],
        ),
      ),
    );
  }
}
