import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tailus/src/api/api_ulr.dart';
import 'package:tailus/src/features/login/model/login_model.dart';
import 'package:tailus/src/helper_functions/helper_functions.dart';

class SignInService{
  Future<String?> signInServece(LoginUser user) async {
    try {
      Response response = await Dio().post(ApiUrl().baseUrl + ApiUrl().signInUrl,data: user.toJson());
      if(response.statusCode! >= 200 || response.statusCode! <= 299){
        final details = LoginUserDetails.fromJson(response.data);
        HelperFunctions.saveAccessToken(details.userDetails.id, details.token);
        HelperFunctions.userId = await HelperFunctions.getAccessToken();
        return "success";
      } else {
        log(response.data.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      if(e.response?.data is Map && e.response!.data['error'] != null){
        return e.response!.data['error'];
      }
      return 'something went wrong';
    }
    return null;
  }
}