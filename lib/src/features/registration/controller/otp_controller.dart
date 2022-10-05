
import 'package:flutter/material.dart';
import 'package:tailus/src/features/bottom/view/bottom_view.dart';
import 'package:tailus/src/features/home/view/home_view.dart';
import 'package:tailus/src/features/registration/model/registration_model.dart';
import 'package:tailus/src/service/authentication_services/otp_services.dart';
import 'package:tailus/src/widgets/custom_snackbar/custom_snackbar.dart';

class OtpController with ChangeNotifier{

  TextEditingController otpController = TextEditingController();

  bool isLoading = false;

  void otpVarification(BuildContext context, RegistrationModel model, String otp) async {
    if(isLoading != true){
      isLoading = true;
      notifyListeners();
      OtpService().otpVarification(model, otp).then((value) {
        if(value == "success"){
          isLoading = false;
          notifyListeners();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  BottomView()));
        } else {
          isLoading = false;
          notifyListeners();
          customSnackBar(context, value!);
        }
      });
    }
  }
}