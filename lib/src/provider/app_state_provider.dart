import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class AppStateProvider extends ChangeNotifier {
  final _appCache = AppCache();
  bool _isRegistered = false;
  bool _isLoggedIn = false;
  bool _hasOnboarded = false;
  bool _isDarkMode = false;
  int _homePage = 0;
  List<dynamic> favIds = [];

  bool get isRegistered {
    return _isRegistered;
  }

  int get homePage {
    return _homePage;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  bool get isDarkMode {
    return _isDarkMode;
  }

  Future<void> initializeApp() async {
    _isRegistered = await _appCache.isUserRegistered();
    _isLoggedIn = await _appCache.isUserLoggedIn();
    _hasOnboarded = await _appCache.hasUserOnboarded();
    _isDarkMode = await _appCache.isDarkMode();
    _homePage = await _appCache.getHomePage();
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    favIds = await _appCache.getFavIds();

    await Hive.openBox('cart');
    _appCache.getCartBox();
    await Hive.openBox('favb');
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
    _appCache.onboardUser();
    notifyListeners();
  }

  void toggleDarkMode(bool newState) {
    _isDarkMode = newState;
    _appCache.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  void setHomePage(int page) {
    _homePage = page;
  }
}