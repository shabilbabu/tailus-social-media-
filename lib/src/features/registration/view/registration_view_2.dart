import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/registration/view/registration_view.dart';
import 'package:tailus/src/widgets/container_button/container_button.dart';
import '../../../widgets/textfield/textfield.dart';
import '../controller/registration_controller.dart';

class RegistrationView2 extends StatelessWidget {
  const RegistrationView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegistrationController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const RegistrationView()));
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
                color: HexColor(
                  '#0C1559',
                ),
              )),
        ),
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
                Form(
                  key: controller.usernameFormkey,
                  child: CustomTextFormField(
                    controller: controller.usernameController,
                    hintText: '  Username',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username is required';
                      } else if (value.length < 3) {
                        return 'Username should be atleast 3 digit';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        controller.usernameFormkey.currentState!.validate(),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Form(
                  key: controller.fullnameFormKey,
                  child: CustomTextFormField(
                    controller: controller.fullnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Fullname is required';
                      } else if (value.length < 5) {
                        return 'Fullname should be atleast 5 digit';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        controller.fullnameFormKey.currentState!.validate(),
                    hintText: '  Fullname',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () => controller.toRegistration(context),
                  child: Consumer<RegistrationController>(
                      builder: (context, value, child) {
                    return value.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: HexColor(
                                '#0C1559',
                              ),
                            ),
                          )
                        : ContainerButton(
                            height: 60.w,
                            fontSize: 18,
                            text: 'Sign up',
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
