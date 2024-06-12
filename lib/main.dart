import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/provider/auth/auth_provider.dart';

import 'core/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //create navigatorKey is globlae anywhre we can access
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      ChangeNotifierProvider<AuthProvider>(create: (contex)=>_)
    ]);
  }
}

c
