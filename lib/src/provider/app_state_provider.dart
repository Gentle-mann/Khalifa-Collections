import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class AppStateProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _hasOnboarded = false;
  bool _isDarkMode = false;
  final _appCache = AppCache();
  bool get isLoggedIn {
    return _isLoggedIn;
  }

  bool get isDarkMode {
    return _isDarkMode;
  }

  Future<void> initializeApp() async {
    _isLoggedIn = await _appCache.isUserLoggedIn();
    _hasOnboarded = await _appCache.hasUserOnboarded();
    _isDarkMode = await _appCache.isDarkMode();
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox('cart');
    await Hive.openBox('fav1');
  }

  bool get hasOnboarded {
    return _hasOnboarded;
  }

  void login() {
    _isLoggedIn = true;
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
}
