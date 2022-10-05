import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailus/src/features/bottom/view/bottom_view.dart';
import 'package:tailus/src/features/home/view/home_view.dart';
import 'package:tailus/src/features/login/model/login_model.dart';
import 'package:tailus/src/service/authentication_services/sign_in_service.dart';
import 'package:tailus/src/widgets/custom_snackbar/custom_snackbar.dart';

class LoginController with ChangeNotifier{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
    GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

    bool isLoading = false;

    loginFunction(BuildContext context){
      emailFormKey.currentState!.validate() &&
      passwordFormKey.currentState!.validate()
      ? isValidate(context)
      : Text('');
    }

    isValidate(BuildContext context){
      final model = LoginUser(email: emailController.text.trim(), passWord: passwordController.text.trim(),);
      if(isLoading != true){
        isLoading = true;
        notifyListeners();
        SignInService().signInServece(model).then((value) {
          isLoading = false;
          notifyListeners();
          if(value == "success"){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  BottomView()));
            emailController.clear();
            passwordController.clear();
          } else {
            isLoading = false;
            notifyListeners();
            customSnackBar(context, value!);
          }
        });
      }
    }
}