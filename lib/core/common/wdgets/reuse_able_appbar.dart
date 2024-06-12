import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/utils/user_data.dart';

import '../../view/login_screen.dart';
import '../../view/update_profile_screen.dart';

AppBar ReuseAbleAppBar(context, {bool isTapppable = true}) {
  return AppBar(
    backgroundColor: Colors.greenAccent,
    title: ListTile(
      onTap: () {
        if (isTapppable == false) {
          return;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.green.shade500,
        child: const Icon(Icons.person),
      ),
      title:  Text("${UserData.firstName ?? ""} ${UserData.lastName ?? ""}"),
      subtitle:  Text(UserData.email ?? ""),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            final shareprefs = await SharedPreferences.getInstance();
            shareprefs.clear();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          },
          icon: const Icon(Icons.logout)),
    ],
  );
}
