import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/provider/app_state_provider.dart';

import '../../app_components/custom_button.dart';
import '../../app_components/underlined_text.dart';
import '../../colors.dart';
import '../../size_setup.dart';
import 'component/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeSetup().setReferenceSizes(context);
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(rSize * 2),
          child: Column(
            children: [
              WelcomeImages(rSize: rSize),
              SizedBox(height: rSize * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: rSize * 2.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      text: 'The ',
                      children: const [
                        TextSpan(
                          text: 'fashion store ',
                          style: TextStyle(color: AppColors.kPrimaryColor),
                        ),
                        TextSpan(
                          text: 'that \nmakes you look your best!',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: rSize),
              const Text(
                'Choose from our wonderful collections of exclusive, classic, and budget clothing materials including shirts, trousers, coats, shoes, and caps.',
              ),
              SizedBox(height: rSize * 2),
              CustomButton(
                title: 'Get started',
                onPressed: () {
                  Provider.of<AppStateProvider>(context, listen: false)
                      .onboard();

                  //context.go('/signup');
                  //Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
              ),
              SizedBox(height: rSize * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  const SizedBox(width: 10),
                  UnderlinedText(
                    'Sign in',
                    onTap: () {
                      Provider.of<AppStateProvider>(context, listen: false)
                          .onboard();
                      Provider.of<AppStateProvider>(context).register(true);
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
