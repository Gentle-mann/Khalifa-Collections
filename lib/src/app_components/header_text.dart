import 'package:flutter/material.dart';

import '../size_setup.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Text(
      title,
      style: TextStyle(fontSize: rSize * 4),
    );
  }
}
