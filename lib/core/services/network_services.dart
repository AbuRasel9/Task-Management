import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/models/signup_request.dart';

import '../../main.dart';
import '../../utils/user_data.dart';
import '../view/login_screen.dart';

class NetworkRequester<T>{
  Future postRequester(String url, SignUpRequest body) async {
    //try catch use for catch error
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            'token': UserData.token ?? ""
          },
          body: jsonEncode(body));
      Logger().i((response.statusCode));
      Logger().i(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      else if (response.statusCode == 401) {
        final shareprefs = await SharedPreferences.getInstance();
        shareprefs.clear();
        Navigator.pushAndRemoveUntil(
            MyApp.navigatorKey.currentState!.context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }

      else {
        Logger().e("request failled");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}