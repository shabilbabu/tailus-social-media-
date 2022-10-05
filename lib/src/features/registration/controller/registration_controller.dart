
import 'package:flutter/material.dart';
import 'package:tailus/src/features/registration/model/registration_model.dart';
import 'package:tailus/src/features/registration/view/otp.dart';
import 'package:tailus/src/features/registration/view/registration_view_2.dart';
import 'package:tailus/src/service/authentication_services/sign_up_service.dart';
import 'package:tailus/src/widgets/custom_snackbar/custom_snackbar.dart';

class RegistrationController with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  GlobalKey<FormState> usernameFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> fullnameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmPasswordFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> phonenumberFormKey = GlobalKey<FormState>();

  void nextValidation(BuildContext context) {
    emailFormKey.currentState!.validate() &&
            phonenumberFormKey.currentState!.validate() &&
            passwordFormKey.currentState!.validate() &&
            confirmPasswordFormkey.currentState!.validate()
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RegistrationView2()))
        : const Text('');
  }

  bool isLoading = false;

  void toRegistration(BuildContext context) {
    usernameFormkey.currentState!.validate() &&
            fullnameFormKey.currentState!.validate()
           ? isValidate(context)
           : const Text('data');
        
  }

  void isValidate(BuildContext context) {
    final model = RegistrationModel(
      username: usernameController.text.trim(),
      fullname: fullnameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmpssword: confirmPasswordController.text.trim(),
      phoneNumber: phonenumberController.text.trim(),
    );
    if(isLoading != true){
      isLoading = true;
      notifyListeners();
      SignUpService().signUpFunction(model).then((value) {
       isLoading = false;
       notifyListeners();
       if(value == "success"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  OtpView(model: model,)));
       } else {
        customSnackBar(context, value!);
       }
      });
    }
  }
}
