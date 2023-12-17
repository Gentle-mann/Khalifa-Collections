import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/screens/signin/signin_screen.dart';

import '../../../app_components/app_components.dart';
import '../../../colors.dart';
import '../../../models/signup_model.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/auth_validation_provider.dart';
import '../../../size_setup.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const UsernameField(),
          const EmailField(),
          const PasswordField(),
          const ConfirmPasswordField(),
          SizedBox(height: rSize),
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'By clicking Sign Up, you agree with our ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: rSize * 3),
          Consumer<AuthValidationProvider>(
              builder: (context, authValidationProvider, child) {
            return Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
              return CustomButton(
                title: 'Sign up',
                onPressed: () async {
                  //Navigator.of(context).pushNamed(HomeScreen.routeName);
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final signUpModel = SignUpModel(
                      email: authValidationProvider.email,
                      password: authValidationProvider.password,
                      username: authValidationProvider.username,
                    );
                    await authProvider
                        .signUpUser(signUpModel)
                        .then((signUpResponse) {
                      if (signUpResponse) {
                        Navigator.of(context).pushNamed(SignInScreen.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Yo! sign up fail')));
                      }
                    });
                  }
                },
              );
            });
          }),
        ],
      ),
    );
  }
}
