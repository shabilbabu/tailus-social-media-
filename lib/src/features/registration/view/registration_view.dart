import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/login/view/login_view.dart';
import 'package:tailus/src/features/registration/controller/registration_controller.dart';
import 'package:tailus/src/features/registration/view/registration_view_2.dart';
import 'package:tailus/src/widgets/container_button/container_button.dart';
import 'package:tailus/src/widgets/textfield/textfield.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegistrationController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
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
                  'Create your Account',
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: controller.emailFormKey,
                  child: CustomTextFormField(
                    controller: controller.emailController,
                    hintText: '  Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter a valid email Address';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        controller.emailFormKey.currentState!.validate(),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Form(
                  key: controller.phonenumberFormKey,
                  child: CustomTextFormField(
                    controller: controller.phonenumberController,
                    hintText: '  Phone Number',
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Phone Number is required';
                      } else if(value.length < 10){
                        return 'Phone Number should be 10 digit';
                      }
                      return null;
                    },
                    onChanged: (value) => controller.phonenumberFormKey.currentState!.validate(),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                 Form(
                  key: controller.passwordFormKey,
                   child: CustomTextFormField(
                    controller: controller.passwordController,
                    hintText: '  Password',
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Password is required';
                      } else if(value.length < 8 || value.length > 20){
                        return 'Password should be minimum 8 digit and maximum 20 digit';
                      }
                      return null;
                    },
                                 ),
                 ),
                SizedBox(
                  height: 15.h,
                ),
                 Form(
                  key: controller.confirmPasswordFormkey,
                   child: CustomTextFormField(
                    controller: controller.confirmPasswordController,
                    hintText: '  Confirm Password',
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Confirm password is required';
                      } else if(value != controller.passwordController.text.trim()){
                        return 'Please enter valid password';
                      }
                      return null;
                    },
                                 ),
                 ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.nextValidation(context);
                  },
                  child: ContainerButton(
                    height: 60.w,
                    fontSize: 18,
                    text: 'Next',
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: Text(
                    ' - Or Sign up with -',
                    style: GoogleFonts.rubik(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: AssetImage('assets/google_icon final.png'),
                      ),
                    ),
                    Container(
                      height: 60.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Image(
                          image: AssetImage('assets/facebookicon-final.png')),
                    ),
                    Container(
                      height: 60.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: AssetImage('assets/github icon final.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account  ",
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: HexColor(
                              '#0C1559',
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginView()),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
