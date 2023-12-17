import 'package:flutter/material.dart';

import '../../app_components/header_text.dart';
import '../../app_components/social_media_card.dart';
import '../../app_components/underlined_text.dart';
import '../../size_setup.dart';
import '../signup/signup_screen.dart';
import 'components/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    SizeSetup().setReferenceSizes(context);
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: rSize * 5,
          horizontal: rSize * 2,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderText('Sign In'),
              const Text('Hello, welcome back. You\'ve been missed! 😊'),
              SizedBox(height: rSize * 3),
              const SignInForm(),
              SizedBox(height: rSize * 5),
              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Text('Or sign in with'),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: rSize * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaCard(
                    'assets/icons/apple.svg',
                    onTap: () {},
                  ),
                  SocialMediaCard(
                    'assets/icons/google.svg',
                    onTap: () {},
                  ),
                  SocialMediaCard(
                    'assets/icons/facebook.svg',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: rSize * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account yet? '),
                  UnderlinedText(
                    'Sign up',
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
