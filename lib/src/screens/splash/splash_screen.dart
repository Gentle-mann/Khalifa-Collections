import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../colors.dart';
import '../../size_setup.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Seed',
              style: TextStyle(
                fontSize: rSize * 4,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(width: rSize),
            SvgPicture.asset(
              'assets/icons/seed.svg',
              height: rSize * 4,
            ),
          ],
        ),
      ),
    );
  }
}
