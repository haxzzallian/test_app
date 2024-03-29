import 'package:my_app/constants/app-endpoint.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/home-page.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  signInUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${appBaseUrl}api/auth'));
      request.fields.addAll({
        'server_key':
            '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744',
        'username': username,
        'password': password,
        'device_type': 'phone'
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final data = await json.decode(responseString);
        var apiStatus = data['api_status'];

        if (apiStatus == '400') {
          var errors = data['errors']['error_text'] ?? "";
          showSnackBar(context, errors);
        } else if (apiStatus == '500') {
          showSnackBar(context, "Server error");
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
          showSnackBar(context, "Login Successful");
          var token = data['access_token'];
        }
      } else {
        showSnackBar(context, "Server Error");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
