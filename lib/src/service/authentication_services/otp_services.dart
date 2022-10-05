import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tailus/src/api/api_ulr.dart';
import 'package:tailus/src/features/registration/model/otp_verification_model.dart';
import 'package:tailus/src/features/registration/model/registration_model.dart';
import 'package:tailus/src/helper_functions/helper_functions.dart';

class OtpService{
  Future<String?> otpVarification(RegistrationModel model, String otp) async {
    try{
      Map data = model.tojson();
      data["Otp"] = otp;

      Response response = await Dio().post(ApiUrl().baseUrl + ApiUrl().otpUrl, data: data);
      if(response.statusCode! >= 200 || response.statusCode! <= 299){
        final details = OtpVerification.fromJson(response.data);
       await HelperFunctions.saveAccessToken(details.userDetails.id, details.token); 
       HelperFunctions.userId = await HelperFunctions.getAccessToken();
       return "success";
      } else {
        log('otp failed');
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e){
      if(e.message.startsWith("SocketException")){
        return "Please check your internet connection";
      }
      return e.response!.data['error'];
    }
    return null;
  }
}