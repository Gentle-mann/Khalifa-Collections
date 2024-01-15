import 'package:flutter/material.dart';

import '../size_setup.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: rSize * 1.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: const Text('See all'),
        // ),
      ],
    );
  }
}
