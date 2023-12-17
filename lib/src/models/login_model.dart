import 'dart:convert';

SignInModel loginModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String loginModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
