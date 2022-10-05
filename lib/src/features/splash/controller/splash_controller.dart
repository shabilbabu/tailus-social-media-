
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tailus/src/features/bottom/view/bottom_view.dart';
import 'package:tailus/src/features/login/view/login_view.dart';
import 'package:tailus/src/helper_functions/helper_functions.dart';

class SplashController with ChangeNotifier{

  navigate(BuildContext context) async{
    String? token = await HelperFunctions.getAccessToken();
    log(token.toString());
    Future.delayed(const Duration(seconds: 3)).whenComplete(
          () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                 token!.isNotEmpty ?  BottomView() : const LoginView()
            ),
          ),
        );
  }
}