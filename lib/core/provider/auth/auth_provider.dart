 import 'package:flutter/cupertino.dart';

import '../../models/signup_response.dart';

 abstract class AuthProvider with ChangeNotifier{
  Future<SignUpResponse> Registration({
   required String email,
   required String firstName,
   required String lastName,
   required String mobile,
   required String password,
 });

}