import 'package:flutter/material.dart';

import '../size_setup.dart';

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rSize * 2,
        vertical: rSize * 4,
      ),
      child: child,
    );
  }
}
