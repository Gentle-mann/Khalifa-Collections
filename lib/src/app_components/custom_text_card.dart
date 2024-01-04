import 'package:flutter/material.dart';

import '../size_setup.dart';

class CustomTextCard extends StatelessWidget {
  const CustomTextCard({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rSize * 1.5)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: rSize,
          horizontal: rSize * 1.5,
        ),
        child: child,
      ),
    );
  }
}
