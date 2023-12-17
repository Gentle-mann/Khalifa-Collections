import 'package:flutter/material.dart';

import '../../../app_components/app_components.dart';
import '../../../size_setup.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            onChanged: (value) {},
            hintText: 'Enter your new password',
            title: 'New password',
          ),
          CustomFormField(
            onChanged: (value) {},
            hintText: 'Confirm your new password',
            title: 'Confirm password',
          ),
          SizedBox(height: rSize * 3),
          CustomButton(
            title: 'Change Password',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
