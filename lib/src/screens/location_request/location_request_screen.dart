import 'package:flutter/material.dart';

import '../../app_components/custom_button.dart';
import '../../colors.dart';
import '../../size_setup.dart';

class LocationRequestScreen extends StatelessWidget {
  const LocationRequestScreen({super.key});
  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: rSize * 5,
              width: rSize * 5,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: AppColors.kTertiaryColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/location.png'),
            ),
            SizedBox(height: rSize * 2),
            const Text(
              'We need to know your location in order to suggest nearby services',
            ),
            SizedBox(height: rSize * 3),
            CustomButton(
              title: 'Allow location access',
              onPressed: () {},
            ),
            SizedBox(height: rSize * 3),
            TextButton(
              onPressed: () {},
              child: const Text('Enter Location Manually'),
            ),
          ],
        ),
      ),
    );
  }
}
