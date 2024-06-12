// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled1/main.dart';
// import 'package:untitled1/screens/login_screen.dart';
// import 'package:untitled1/utils/user_data.dart';
//
// class networkRequester {
//   //get method
//   Future getRequester(String url) async {
//     //try catch use for catch error
//     try {
//       http.Response response = await http.get(Uri.parse(url),
//         headers: {
//           "Content-type": "application/json",
//           "Accept": "application/json",
//           'token': userData.token ?? ""
//         },
//       );
//       if (response.statusCode == 200) {
//         Logger().i(response.body);
//         return jsonDecode(response.body);
//       }
//       else if (response.statusCode == 401) {
//         final shareprefs = await SharedPreferences.getInstance();
//         shareprefs.clear();
//         Navigator.pushAndRemoveUntil(
//             MyApp.navigatorKey.currentState!.context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//                 (route) => false);
//       }
//
//
//       else {
//         Logger().e("request failled");
//       }
//     } catch (e) {
//       Logger().e(e);
//     }
//   }
//
//   //post method
//   Future postRequester(String url, Map<String, String> body) async {
//     //try catch use for catch error
//     try {
//       http.Response response = await http.post(Uri.parse(url),
//           headers: {
//             "Content-type": "application/json",
//             "Accept": "application/json",
//             'token': userData.token ?? ""
//           },
//           body: jsonEncode(body));
//       Logger().i((response.statusCode));
//       Logger().i(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//       else if (response.statusCode == 401) {
//         final shareprefs = await SharedPreferences.getInstance();
//         shareprefs.clear();
//         Navigator.pushAndRemoveUntil(
//             MyApp.navigatorKey.currentState!.context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//             (route) => false);
//       }
//
//       else {
//         Logger().e("request failled");
//       }
//     } catch (e) {
//       Logger().e(e);
//     }
//   }
// }
