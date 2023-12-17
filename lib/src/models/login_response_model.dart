import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.token,
    required this.username,
    required this.email,
    required this.location,
  });

  final String id;
  final String token;
  final String username;
  final String email;
  final String location;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["_id"],
        token: json["token"],
        username: json["username"],
        email: json["email"],
        location: json["location"],
      );
}
