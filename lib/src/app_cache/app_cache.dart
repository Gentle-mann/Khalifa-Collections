import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const kRegister = 'register';
  static const kPage = 'page';
  static const kLogin = 'login';
  static const kOnboard = 'onboard';
  static const kUserToken = 'userToken';
  static const kUserId = 'userId';
  static const kDarkMode = 'darkMode';
  static const kFavBox = 'fava';
  static const kOrdersBox = 'orders';
  static const kAddressList = 'addressList';
  static const kPhoneNumber = 'phoneNumber';

  Future<void> saveAddressList(List<String> addressList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kAddressList, addressList);
  }

  Future<List<String>> getAddressList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(kAddressList) ?? [];
  }

  Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kPhoneNumber, phone);
  }

  Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kPhoneNumber) ?? '';
  }

  void setFavIds(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ids', ids);
  }

  void saveHomePage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(kPage, page);
  }

  Future<int> getHomePage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(kPage) ?? 0;
  }

  Future<List<String>> getFavIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('ids') ?? [];
  }

  Box<dynamic> getOrdersBox() {
    return Hive.box(kOrdersBox);
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

  Future<String> getUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kUserId) ?? '';
  }

  Future<void> onboardUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kOnboard, true);
  }

  Future<void> registerUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kRegister, true);
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLogin, true);
  }

  Future<bool> isUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kRegister) ?? false;
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
