import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/app_state_provider.dart';

import '../../../app_components/app_components.dart';
import '../../../models/signup_model.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/auth_validation_provider.dart';
import '../../../size_setup.dart';
import '../../../core/utils/snackbar.dart';

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
          SizedBox(height: rSize * 3),
          Consumer<AuthValidationProvider>(
              builder: (context, authValidationProvider, child) {
            return Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
              return CustomButton(
                title: 'Sign up',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final signUpModel = SignUpModel(
                      email: authValidationProvider.email,
                      password: authValidationProvider.password.trim(),
                      username: authValidationProvider.username,
                    );
                    await authProvider
                        .signUpUser(signUpModel)
                        .then((signUpResponse) {
                      if (signUpResponse) {
                        Provider.of<AppStateProvider>(context, listen: false)
                            .register(true);

                        Provider.of<AuthValidationProvider>(context,
                                listen: false)
                            .onEmailSaved(authValidationProvider.email);

                        context.goNamed('sign-in');
                      } else {
                        ShowSnackBar.showSnackBar(
                          'Sign up not successful',
                          context,
                        );
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
