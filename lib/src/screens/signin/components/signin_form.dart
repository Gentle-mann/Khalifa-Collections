import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/models/login_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/provider/auth_validation_provider.dart';

import '../../../app_components/custom_button.dart';
import '../../../app_components/custom_form_field.dart';
import '../../../colors.dart';
import '../../../size_setup.dart';
import '../../change_password/change_password_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const EmailField(),
          SizedBox(height: rSize),
          const PasswordField(),
          SizedBox(height: rSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text('Remember me'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ChangePasswordScreen.routeName);
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: rSize * 3),
          Consumer<AuthValidationProvider>(
              builder: (context, authValidationProvider, child) {
            return Consumer<AuthProvider>(
                builder: (context, signInProvider, child) {
              return Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                return CustomButton(
                  title: 'Sign in',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final signInModel = SignInModel(
                        email: authValidationProvider.email,
                        password: authValidationProvider.password,
                      );
                      await signInProvider
                          .signInUser(signInModel)
                          .then((signInResponse) {
                        if (signInResponse) {
                          Provider.of<AppStateProvider>(context, listen: false)
                              .login();
                          AppCache().registerUser();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Yo! sign in fail'),
                            ),
                          );
                        }
                      });
                    }
                  },
                );
              });
            });
          }),
        ],
      ),
    );
  }
}
