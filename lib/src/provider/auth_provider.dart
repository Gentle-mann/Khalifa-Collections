import 'package:flutter/material.dart';
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/models/login_model.dart';
import 'package:seed/src/models/signup_model.dart';
import 'package:seed/src/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final appCache = AppCache();
  bool _isLoading = false;
  String _selectedAddress = '';
  String get selectedAddress => _selectedAddress;
  final List<String> _deliveryAddresses = [];
  List<String> get deliveryAddresses => _deliveryAddresses;
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  void selectAddress(newAddress) {
    _selectedAddress = newAddress;

    notifyListeners();
  }

  void addAddress(String newAddress) {
    deliveryAddresses.add(newAddress);
    appCache.saveAddressList(deliveryAddresses);
    notifyListeners();
  }

  void removeAddress(String newAddress) {
    deliveryAddresses.removeWhere((element) => element == newAddress);
    appCache.saveAddressList(deliveryAddresses);
    notifyListeners();
  }

  void savePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    appCache.savePhone(phoneNumber);
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  void toggleLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  bool _loginResponse = false;
  bool get loginResponse {
    return _loginResponse;
  }

  void setLoginResponse(bool newState) {
    _loginResponse = newState;
    notifyListeners();
  }

  bool? _isUserLoggedIn = false;
  bool get isUserLoggedIn {
    return _isUserLoggedIn ?? false;
  }

  void toggleUserLoggedIn(bool newState) {
    _isUserLoggedIn = newState;
    notifyListeners();
  }

  Future<bool> signInUser(SignInModel signInModel) async {
    _isLoading = true;
    final response = await AuthService().signIn(signInModel);
    setLoginResponse(response);
    _isLoading = false;
    final isUserLoggedIn = await appCache.isUserLoggedIn();
    toggleUserLoggedIn(isUserLoggedIn);
    notifyListeners();
    return loginResponse;
  }

  Future<bool> signUpUser(SignUpModel signUpModel) async {
    _isLoading = true;
    //toggleProcessing(false);
    final response = await AuthService().signUp(signUpModel);
    _isLoading = false;

    // setLoginResponse(response);
    // toggleProcessing(true);
    // final isUserLoggedIn = await appCache.isUserLoggedIn();
    // toggleUserLoggedIn(isUserLoggedIn);
    // return loginResponse;
    return response;
  }

  //Future<bool> signUpUser(SignUpModel signUpModel) async {}

  void signOutUser() async {}
}
