import 'package:flutter/material.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/app_components.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: rSize * 2,
          vertical: rSize * 3,
        ),
        child: Column(
          children: [
            const ScreenTitleRow(title: 'My Cart'),
            SizedBox(height: rSize * 3),
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('Confirm your address'),
              ),
            ),
            TextField(
              decoration: InputDecoration(),
            )
          ],
        ),
      ),
    );
  }
}
