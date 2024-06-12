import 'package:untitled1/core/models/signup_request.dart';
import 'package:untitled1/core/models/signup_response.dart';
import 'package:untitled1/core/provider/auth/auth_provider.dart';
import 'package:untitled1/core/services/network_services.dart';
import 'package:untitled1/utils/AppStringConstant.dart';

class _AuthProviderImpl extends AuthProvider {
  @override
  Future<SignUpResponse> Registration({required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
    }) async {
    SignUpRequest request= SignUpRequest(
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        password: password,
    ) ;


   final result=await NetworkRequester().postRequester(
        "${AppStringConstant.baseUrl}/registration", request );
   notifyListeners();

   return result();


  }

}
