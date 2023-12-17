import 'package:flutter/material.dart';

import '../size_setup.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Text(
      title,
      style: TextStyle(
        fontSize: rSize * 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
