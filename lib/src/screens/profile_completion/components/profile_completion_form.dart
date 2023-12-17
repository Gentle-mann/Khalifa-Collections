import 'package:flutter/material.dart';

import '../../../app_components/app_components.dart';

class ProfileCompletionForm extends StatefulWidget {
  const ProfileCompletionForm({super.key});

  @override
  State<ProfileCompletionForm> createState() => _ProfileCompletionFormState();
}

class _ProfileCompletionFormState extends State<ProfileCompletionForm> {
  late final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            onChanged: (value) {},
            hintText: 'Enter your phone Number',
            title: 'Phone number',
          ),
          CustomFormField(
            onChanged: (value) {},
            hintText: 'Enter your Gender',
            title: 'Gender',
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {},
            title: 'Complete profile',
          ),
        ],
      ),
    );
  }
}
