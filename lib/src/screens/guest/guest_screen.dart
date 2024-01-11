import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed/src/app_components/app_components.dart';
import 'package:seed/src/core/responsive/responsive.dart';
import 'package:seed/src/size_setup.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: DefaultPadding(
        child: Column(
          children: [
            Text(
              'Kindly sign in to access this feature. 🤗👇🏿',
              style: TextStyle(fontSize: rSize * 2),
            ),
            SizedBox(
              height: rSize * 2,
            ),
            Responsive(
              child: CustomButton(
                  title: 'Sign In',
                  onPressed: () {
                    context.go('/sign-in');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
