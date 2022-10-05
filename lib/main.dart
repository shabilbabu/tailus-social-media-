import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailus/src/features/bottom/controller/bottom_controller.dart';
import 'package:tailus/src/features/login/controller/login_controller.dart';
import 'package:tailus/src/features/registration/controller/otp_controller.dart';
import 'package:tailus/src/features/registration/controller/registration_controller.dart';
import 'package:tailus/src/features/registration/view/otp.dart';
import 'package:tailus/src/features/splash/controller/splash_controller.dart';
import 'package:tailus/src/features/splash/view/splash_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => SplashController()),
            ChangeNotifierProvider(create: (context) => RegistrationController()),
            ChangeNotifierProvider(create: (context) => OtpController()),
            ChangeNotifierProvider(create: (context) => LoginController()),
            ChangeNotifierProvider(create: (context) => BottomController()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          ),
        );
      },
      designSize: const Size(411.42857142857144, 843.4285714285714),
    );
  }
}
