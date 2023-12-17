import 'package:flutter/material.dart';

import '../../../app_theme/input_decoration.dart';
import '../../../size_setup.dart';

class OTPDigitField extends StatelessWidget {
  const OTPDigitField(
      {super.key,
      this.autofocus = false,
      required this.onChanged,
      this.focusNode});
  final bool autofocus;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: rSize * 2),
      child: SizedBox(
        width: rSize * 5,
        height: rSize * 4,
        child: TextField(
          onChanged: onChanged,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: rSize),
          obscureText: true,
          decoration: TextFieldTheme.otpFieldTheme(),
        ),
      ),
    );
  }
}
