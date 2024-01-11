import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/auth_validation_provider.dart';

import '../size_setup.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.title,
    this.suffixIcon,
    this.textInputType,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  final String hintText;
  final String title;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      margin: EdgeInsets.only(bottom: rSize * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: rSize * 0.5),
          TextFormField(
            style: TextStyle(fontSize: rSize * 1.5),
            onSaved: onSaved,
            validator: validator,
            autocorrect: false,
            keyboardType: textInputType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthValidationProvider>(
        builder: (context, authProvider, child) {
      return CustomFormField(
        hintText: 'Enter your email address',
        title: 'Email',
        textInputType: TextInputType.emailAddress,
        onSaved: (email) {
          authProvider.onEmailSaved(email!);
        },
        validator: (email) {
          final regExpEmailValidator =
              RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z09]+\.[a-zA-Z]+");

          if (!regExpEmailValidator.hasMatch(email!)) {
            return 'Enter a valid email';
          }
          return null;
        },
      );
    });
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthValidationProvider>(
        builder: (context, authProvider, child) {
      return CustomFormField(
        obscureText: true,
        hintText: 'Enter your password',
        title: 'Password',
        textInputType: TextInputType.visiblePassword,
        onChanged: (password) {
          authProvider.onPasswordChangedOrSaved(password);
          print(' password: ${authProvider.password}');
        },
        validator: (password) {
          if (password!.length < 6) {
            return 'Password needs to be at least 6 characters';
          }
          return null;
        },
        onSaved: (password) {
          authProvider.onPasswordChangedOrSaved(password!);
        },
        // suffixIcon: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.visibility_off),
        // ),
      );
    });
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthValidationProvider>(
        builder: (context, authProvider, child) {
      return CustomFormField(
        hintText: 'Confirm your password',
        title: 'Confirm password',
        onSaved: (confirmPassword) {
          authProvider.onConfirmPasswordChangedOrSaved(confirmPassword!);
          print('confirm password: ${authProvider.confirmPassword}');
        },
        validator: (confirmPassword) {
          if (confirmPassword != authProvider.password) {
            return 'Passwords don\'t match';
          }
          return null;
        },
        obscureText: true,
        textInputType: TextInputType.visiblePassword,
      );
    });
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthValidationProvider>(
        builder: (context, authProvider, child) {
      return CustomFormField(
        hintText: 'Choose a username',
        title: 'Username',
        onSaved: (username) {
          authProvider.onUsernameSaved(username!);
        },
        validator: (username) {
          if (username!.isEmpty) {
            return 'Enter a username';
          }
          return null;
        },
      );
    });
  }
}
