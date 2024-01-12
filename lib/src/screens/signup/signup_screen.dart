import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app_components/app_components.dart';

import '../../provider/app_state_provider.dart';
import '../../provider/auth_provider.dart';
import '../../size_setup.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    SizeSetup().setReferenceSizes(context);
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: rSize * 2,
          left: rSize * 2,
          top: rSize * 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderText('Sign Up'),
              SizedBox(height: rSize),
              const Text(
                'We\'re so excited to have you! 😄\nFill in the information below to register 👇🏿',
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
              // SizedBox(height: rSize * 2),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SocialMediaCard(
              //       'assets/icons/apple.svg',
              //       onTap: () {},
              //     ),
              //     SocialMediaCard(
              //       'assets/icons/google.svg',
              //       onTap: () {},
              //     ),
              //     SocialMediaCard(
              //       'assets/icons/facebook.svg',
              //       onTap: () {},
              //     ),
              //   ],
              // ),
              SizedBox(height: rSize * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  SizedBox(width: rSize),
                  UnderlinedText(
                    'Sign in',
                    onTap: () {
                      Provider.of<AppStateProvider>(context, listen: false)
                          .register(true);
                      Provider.of<AuthProvider>(context, listen: false)
                          .toggleLoading(false);
                      context.goNamed('sign-in');
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
