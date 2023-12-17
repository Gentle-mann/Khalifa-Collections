import 'package:flutter/material.dart';

import 'otp_digit_field.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late final _formKey = GlobalKey<FormState>();
  late final otp2Focus = FocusNode();
  late final otp3Focus = FocusNode();
  late final otp4Focus = FocusNode();

  void nextOTPField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    otp2Focus.dispose();
    otp3Focus.dispose();
    otp4Focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTPDigitField(
            autofocus: true,
            onChanged: (value) {
              nextOTPField(value: value, focusNode: otp2Focus);
            },
          ),
          OTPDigitField(
            onChanged: (value) {
              nextOTPField(value: value, focusNode: otp3Focus);
            },
            focusNode: otp2Focus,
          ),
          OTPDigitField(
            onChanged: (value) {
              nextOTPField(value: value, focusNode: otp4Focus);
            },
            focusNode: otp3Focus,
          ),
          OTPDigitField(
            onChanged: (value) {
              otp4Focus.unfocus();
            },
            focusNode: otp4Focus,
          ),
        ],
      ),
    );
  }
}
