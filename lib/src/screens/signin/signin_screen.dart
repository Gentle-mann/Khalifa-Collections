import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/app_state_provider.dart';

import '../../app_components/header_text.dart';
import '../../app_components/underlined_text.dart';
import '../../size_setup.dart';
import 'components/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              const Text('Hello, welcome back. We\'ve missed you! 😊'),
              SizedBox(height: rSize * 3),
              const SignInForm(),
              // SizedBox(height: rSize * 5),
              // const Row(
              //   children: [
              //     Expanded(
              //       child: Divider(),
              //     ),
              //     Text('Or sign in with'),
              //     Expanded(
              //       child: Divider(),
              //     ),
              //   ],
              // ),
              // SizedBox(height: rSize * 3),
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
              SizedBox(height: rSize * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account yet? '),
                  UnderlinedText(
                    'Sign up',
                    onTap: () {
                      Provider.of<AppStateProvider>(context, listen: false)
                          .register(false);
                      //context.goNamed('/signin');
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
