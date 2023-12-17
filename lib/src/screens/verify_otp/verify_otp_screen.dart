import 'package:flutter/material.dart';

import '../../app_components/app_components.dart';

import '../../colors.dart';
import '../../size_setup.dart';
import '../signin/signin_screen.dart';
import 'components/otp_form.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});
  static const routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 2 * rSize, vertical: 5 * rSize),
        child: Column(
          children: [
            const HeaderText('Verify Code'),
            SizedBox(height: rSize),
            const Text(
              'Please enter the code that was just sent to your email address:',
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              'example@gmail.com',
              style: TextStyle(
                color: AppColors.kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: rSize * 2),
            const OTPForm(),
            SizedBox(height: rSize * 6),
            const Text('Didn\'t receive OTP?'),
            SizedBox(height: rSize),
            UnderlinedText(
              'Resend',
              onTap: () {},
            ),
            SizedBox(height: rSize * 3),
            CustomButton(
              title: 'Verify',
              onPressed: () {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
