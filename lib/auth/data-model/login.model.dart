import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequestModel {
  String server_key;
  String username;
  String password;

  LoginRequestModel({
    required this.server_key,
    required this.username,
    required this.password,
  });

  Map toJson() {
    return {
      'server_key': server_key,
      'username': username.trim(),
      'password': password.trim(),
    };
  }
}
