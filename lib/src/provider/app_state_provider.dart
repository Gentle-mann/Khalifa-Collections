import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/provider/orders_provider.dart';
import 'package:seed/src/provider/wishlist_provider.dart';

class AppStateProvider extends ChangeNotifier {
  bool _isRegistered = false;
  bool _isLoggedIn = false;
  bool _hasOnboarded = false;
  bool _isDarkMode = false;
  int _homePage = 0;
  String _userEmail = '';
  List<dynamic> favIds = [];

  bool get isRegistered {
    return _isRegistered;
  }

  String get userEmail => _userEmail;
  // void saveUserEmail(String email) {
  //   _userEmail = email;
  //   AppCache.saveUserEmail(_userEmail);
  // }

  // void getUserEmail() async {
  //   _userEmail = await AppCache.getUserEmail();
  // }

  int get homePage {
    return _homePage;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  bool get isDarkMode {
    return _isDarkMode;
  }

  String _selectedAddress = '';
  String get selectedAddress => _selectedAddress;
  List<String> _deliveryAddresses = [];
  List<String> get deliveryAddresses => _deliveryAddresses;
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  void selectAddress(newAddress) {
    _selectedAddress = newAddress;

    notifyListeners();
  }

  void addAddress(String newAddress) {
    deliveryAddresses.add(newAddress);
    AppCache.saveAddressList(deliveryAddresses);
    notifyListeners();
  }

  void removeAddress(String newAddress) {
    deliveryAddresses.removeWhere((element) => newAddress == element);
    AppCache.saveAddressList(deliveryAddresses);
    notifyListeners();
  }

  void savePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    AppCache.savePhone(phoneNumber);
    notifyListeners();
  }

  Future<void> initializeApp() async {
    _isRegistered = await AppCache.isUserRegistered();
    _isLoggedIn = await AppCache.isUserLoggedIn();
    _hasOnboarded = await AppCache.hasUserOnboarded();
    _isDarkMode = await AppCache.isDarkMode();
    _homePage = await AppCache.getHomePage();
    _deliveryAddresses = await AppCache.getAddressList();
    // _phoneNumber = await _appCache.getPhone();
    // final dir = await getApplicationDocumentsDirectory();
    // Hive.init(dir.path);

    await Hive.openBox('favc');

    await Hive.openBox('orders');
  }

  bool get hasOnboarded {
    return _hasOnboarded;
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void register(bool newState) {
    _isRegistered = newState;
    notifyListeners();
  }

  void onboard() {
    _hasOnboarded = true;
    AppCache.onboardUser();
    notifyListeners();
  }

  void toggleDarkMode(bool newState) {
    _isDarkMode = newState;
    AppCache.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  void setHomePage(int page) {
    _homePage = page;
  }

  void logoutUser() {
    _hasOnboarded = false;
    _isRegistered = false;
    _isLoggedIn = false;
    _homePage = 0;

    notifyListeners();
  }
}
