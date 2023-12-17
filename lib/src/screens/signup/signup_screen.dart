import 'package:flutter/material.dart';

import '../../app_components/app_components.dart';

import '../../size_setup.dart';
import '../signin/signin_screen.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: rSize * 2,
          vertical: rSize * 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderText('Sign Up'),
              SizedBox(height: rSize),
              const Text(
                'Fill in the information below or register with any of your social media accounts',
              ),
              SizedBox(height: rSize * 2),
              const SignUpForm(),
              SizedBox(height: rSize * 2),
              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Text('Or sign up with'),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: rSize * 2),
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
              SizedBox(height: rSize * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  SizedBox(width: rSize),
                  UnderlinedText(
                    'Sign in',
                    onTap: () {
                      Navigator.of(context).pushNamed(SignInScreen.routeName);
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
