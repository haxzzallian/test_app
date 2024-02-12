import 'package:my_app/constants/app-endpoint.dart';
import 'package:my_app/constants/error-handling.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/home-page.dart';
import 'package:my_app/auth/data-model/login.model.dart';
import 'package:my_app/common/data-model/server-response.model.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  signInUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://fashionbiz.org/api/auth'));
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
          print(data);
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
          print(apiStatus);
          print(token);
          print(data);
        }

        //print(await response.stream.bytesToString());
        //print(apiStatus);
        //print(errors);
      } else {
        print(response.reasonPhrase);
        // print(await response.stream.bytesToString());
      }

      /* final response = await http.post(
          Uri.parse('https://fashionbiz.org/api/auth'),
          body: jsonEncode({
            'server_key':
                '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744',
            'username': username.trim(),
            'password': password.trim(),
            'device_type': 'phone'
          }),
          headers: getHeaders(null)
          /*<String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
          //'Content-Type': 'application/json; charset=UTF-8',
        },*/
          );
      final data = await jsonDecode(response.body);
      //final data = await json.decode(json.encode(response.body));
      var apiStatus = data['api_status'];
      if (apiStatus == 200) {
        () async {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
        };
      }

      print(data);
      print(apiStatus);*/

      /*return ServerResponse(
        errors: data['errors'] ?? data,
        api_status: data['api_status'],
      );*/
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  /*signInUser(
      {required BuildContext context,
      required LoginRequestModel loginRequestModel}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$appBaseUrl/api/auth'),
        body: jsonEncode(loginRequestModel),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(res.body);
      print(data);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }*/

  Map<String, String> getHeaders(String? token, {String? contentType}) {
    return {
      'Content-Type': contentType ?? 'application/json',
      if (token != null) 'Authorization': "Bearer $token",
    };
  }
}
