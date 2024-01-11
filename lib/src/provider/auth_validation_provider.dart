import 'package:flutter/foundation.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class AuthValidationProvider extends ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _rememberMe = false;
  bool _isPasswordObscure = true;
  String get username {
    return _username;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String get confirmPassword {
    return _confirmPassword;
  }

  bool get isPasswordObscure {
    return _isPasswordObscure;
  }

  bool get rememberMe {
    return _rememberMe;
  }

  void togglePasswordObscure(bool newState) {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void onUsernameSaved(String username) {
    _username = username;
    notifyListeners();
  }

  void onEmailSaved(String email) {
    _email = email;
    AppCache.saveUserEmail(_email);
    notifyListeners();
  }

  void onPasswordChangedOrSaved(String password) {
    _password = password;
    notifyListeners();
  }

  void onConfirmPasswordChangedOrSaved(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
}
