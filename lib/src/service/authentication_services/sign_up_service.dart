import 'package:dio/dio.dart';
import 'package:tailus/src/api/api_ulr.dart';
import 'package:tailus/src/features/registration/model/registration_model.dart';

class SignUpService{
  Future<String?> signUpFunction(RegistrationModel model) async {
    try {
      Response response = await Dio().post(ApiUrl().baseUrl + ApiUrl().createUrl,data: model.tojson());
      if(response.statusCode! >= 200 || response.statusCode! <= 299){
        return "success";
      } else {

      }
    } on DioError catch (e) {
      if(e.message.startsWith("SocketException")){
        return "Please check your internet connection";
      }
      if(e.response?.data is Map && e.response!.data['error'] != null){
        return e.response!.data['error'];
      }
      return "Something went wrong";
    }
    return null;
  }
}