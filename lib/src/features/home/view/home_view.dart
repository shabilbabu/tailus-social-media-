import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tailus/src/features/splash/view/splash_view.dart';
import 'package:tailus/src/helper_functions/helper_functions.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Image(
              image: AssetImage('assets/logotailusoriginal.png'),
              height: 100,
              width: 100,
            ),
            
          ),
          
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Home Screen',
                style: GoogleFonts.rubik(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              IconButton(
                  onPressed: () {
                    HelperFunctions.removeAccessToken().then((value) {
                      return Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SplashView()));
                    });
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
