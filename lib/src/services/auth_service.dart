import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:seed/src/app_cache/app_cache.dart';
import 'package:seed/src/models/login_model.dart';
import 'package:seed/src/models/login_response_model.dart';
import 'package:seed/src/models/profile_model.dart';
import 'package:seed/src/models/signup_model.dart';

import 'config.dart';

class AuthService {
  var client = https.Client();
  Future<bool> signIn(SignInModel signInModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(url,
        body: jsonEncode(signInModel.toJson()), headers: requestHeaders);

    if (response.statusCode == 200) {
      final userId = loginResponseModelFromJson(response.body).id;
      final userToken = loginResponseModelFromJson(response.body).token;

      await AppCache.saveUserToken(userToken);
      await AppCache.saveUserId(userId);
      await AppCache.loginUser();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(SignUpModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    var response = await https.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    // 5
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ProfileResponseModel> getUserProfile() async {
    final userToken = await AppCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.https(Config.apiUrl, Config.getUserUrl);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var profile = profileResponseFromJson(response.body);
      return profile;
    } else {
      throw Exception('Failed to get user profile');
    }
  }
}
