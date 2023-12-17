import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const kLogin = 'login';
  static const kOnboard = 'onboard';
  static const kUserToken = 'userToken';
  static const kUserId = 'userId';
  static const kDarkMode = 'darkMode';
  static const kCartBox = 'cart';
  static const kFavBox = 'fav1';

  Box<dynamic> getCartBox() {
    return Hive.box(kCartBox);
  }

  Box<dynamic> getFavBox() {
    return Hive.box(kFavBox);
  }

  Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUserToken, token);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString(kUserToken);
    return userToken;
  }

  Future<void> saveUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUserId, id);
  }

  Future<void> onboardUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kOnboard, true);
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLogin, true);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kLogin) ?? false;
  }

  Future<bool> hasUserOnboarded() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kOnboard) ?? false;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(kUserToken);
    await prefs.remove(kUserId);
    await prefs.setBool(kOnboard, false);
    await prefs.setBool(kLogin, false);
  }

  Future<void> setDarkMode(bool newState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kDarkMode, newState);
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kDarkMode) ?? false;
  }
}
