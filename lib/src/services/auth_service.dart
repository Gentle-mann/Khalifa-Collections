import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/models/login_model.dart';
import 'package:seed/src/models/login_response_model.dart';
import 'package:seed/src/models/profile_model.dart';
import 'package:seed/src/models/signup_model.dart';

import 'config.dart';

class AuthService {
  var client = http.Client();
  var appCache = AppCache();
  Future<bool> signIn(SignInModel signInModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiUrl, Config.loginUrl);
    var response = await client.post(
      url,
    );

    final getResponse = await client.post(
        Uri.parse(response.headers["location"]!),
        body: jsonEncode(signInModel.toJson()),
        headers: requestHeaders);

    if (getResponse.statusCode == 200) {
      final userId = loginResponseModelFromJson(getResponse.body).id;
      final userToken = loginResponseModelFromJson(getResponse.body).token;

      await appCache.saveUserToken(userToken);
      await appCache.saveUserId(userId);
      await appCache.loginUser();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(SignUpModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiUrl, Config.signupUrl);
    var response = await http.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    final getResponse = await http.post(
        Uri.parse(response.headers["location"]!),
        body: jsonEncode(model.toJson()),
        headers: requestHeaders);
    if (getResponse.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ProfileResponseModel> getUserProfile() async {
    final userToken = appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.http(Config.apiUrl, Config.getUserUrl);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var profile = profileResponseFromJson(response.body);
      return profile;
    } else {
      throw Exception('Failed to get user profile');
    }
  }
}
