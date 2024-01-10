import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();
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
  static const kFavIds = 'favids';
  static const kOrdersIds = 'ordersIds';

  static Future<void> saveAddressList(List<String> addressList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kAddressList, addressList);
  }

  static Future<List<String>> getAddressList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(kAddressList) ?? [];
  }

  static Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kPhoneNumber, phone);
  }

  static Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kPhoneNumber) ?? '';
  }

  static void saveHomePage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(kPage, page);
  }

  static Future<int> getHomePage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(kPage) ?? 0;
  }

  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUserToken, token);
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString(kUserToken);
    return userToken;
  }

  static Future<void> saveUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUserId, id);
  }

  static Future<String> getUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kUserId) ?? '';
  }

  static Future<void> onboardUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kOnboard, true);
  }

  static Future<void> registerUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kRegister, true);
  }

  static Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLogin, true);
  }

  static Future<bool> isUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kRegister) ?? false;
  }

  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kLogin) ?? false;
  }

  static Future<bool> hasUserOnboarded() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kOnboard) ?? false;
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(kUserToken);
    await prefs.remove(kUserId);
    await prefs.setBool(kOnboard, false);
    await prefs.setBool(kLogin, false);
  }

  static Future<void> setDarkMode(bool newState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kDarkMode, newState);
  }

  static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kDarkMode) ?? false;
  }
}
