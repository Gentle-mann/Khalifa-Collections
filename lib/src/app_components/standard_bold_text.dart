import 'package:flutter/material.dart';

import '../size_setup.dart';

class StandardBoldText extends StatelessWidget {
  const StandardBoldText(this.data, {super.key, this.isColored = false});
  final String data;
  final bool isColored;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: rSize * 1.8,
        //color: !isColored ? Colors.black : AppColors.kPrimaryColor,
      ),
    );
  }
}
