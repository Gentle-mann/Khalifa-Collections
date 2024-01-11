import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/models/login_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/provider/auth_validation_provider.dart';
import 'package:seed/src/core/utils/snackbar.dart';

import '../../../app_components/custom_button.dart';
import '../../../app_components/custom_form_field.dart';
import '../../../size_setup.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final email =
        Provider.of<AuthValidationProvider>(context, listen: false).email;
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: rSize * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email'),
                SizedBox(height: rSize * 0.5),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(fontSize: rSize * 1.5),
                  onSaved: (email) {
                    final authValidationProvider =
                        Provider.of<AuthValidationProvider>(context,
                            listen: false);
                    authValidationProvider.onEmailSaved(email!);
                  },
                  validator: (email) {
                    final regExpEmailValidator =
                        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z09]+\.[a-zA-Z]+");

                    if (!regExpEmailValidator.hasMatch(email!)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: rSize),
          const PasswordField(),
          // SizedBox(height: rSize),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       children: [
          //         Checkbox(
          //           value: true,
          //           onChanged: (value) {},
          //         ),
          //         const Text('Remember me'),
          //       ],
          //     ),
          //     GestureDetector(
          //       onTap: () {

          //       },
          //       child: const Text(
          //         'Forgot Password',
          //         style: TextStyle(
          //           color: AppColors.kPrimaryColor,
          //           decoration: TextDecoration.underline,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
                        print('signInResponse: $signInResponse');
                        if (signInResponse) {
                          Provider.of<AppStateProvider>(context, listen: false)
                              .login();
                          AppCache.registerUser();

                          context.pushReplacementNamed('home');
                        } else {
                          ShowSnackBar.showSnackBar(
                            'Sign in not successful',
                            context,
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
