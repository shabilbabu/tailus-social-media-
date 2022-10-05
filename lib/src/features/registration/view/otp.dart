import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/registration/controller/otp_controller.dart';
import 'package:tailus/src/features/registration/model/registration_model.dart';
import 'package:tailus/src/widgets/container_button/container_button.dart';

import '../controller/registration_controller.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key, required this.model}) : super(key: key);

  final RegistrationModel model;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<OtpController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Center(
                  child: Container(
                    height: 200.h,
                    width: 250.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logotailusoriginal.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Enter your 4 digit varification code sent to \nyour number',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Consumer<OtpController>(builder: (context, value, child) {
                  return PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        selectedFillColor: HexColor(
                          '#0C1559',
                        ),
                        inactiveFillColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 50.h,
                        activeColor: Colors.transparent,
                        fieldWidth: 50.w,
                        errorBorderColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        activeFillColor: Colors.white),
                    animationDuration: const Duration(milliseconds: 300),
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    controller: value.otpController,
                    onCompleted: (value) {},
                    onChanged: (value) {},
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Resend OTP',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    color: HexColor(
                      '#0C1559',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.otpVarification(
                        context, model, controller.otpController.text.trim());
                  },
                  child:
                      Consumer<OtpController>(builder: (context, value, child) {
                    return value.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: HexColor(
                                '#0C1559',
                              ),
                            ),
                          )
                        : ContainerButton(
                            text: 'Verify',
                            fontSize: 18,
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                          );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
