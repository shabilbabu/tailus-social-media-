import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashController>().navigate(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(
          '#0C1559',
        ),
        body:  Center(
                  child: Container(
                    height: 130.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/New Project.png',),),
                    ),
                  ),
                ),
      ),
    );
  }
}