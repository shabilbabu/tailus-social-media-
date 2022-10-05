import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions with ChangeNotifier{
  static String accesstoken = "TOKEN";
  static String userId = "ID";
  static int value = 0;

  static saveAccessToken(String id, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userId, id);
    preferences.setString(accesstoken, token);
  }

  static  getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(userId);
    return  value ?? "";
  }

  static Future  removeAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}