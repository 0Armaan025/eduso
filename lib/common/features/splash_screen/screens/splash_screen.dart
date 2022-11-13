import 'package:eduso/common/features/auth/student_panel/home/home_screen/screens/student_home_screen.dart';
import 'package:eduso/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_variables.dart';
import '../../auth/student_panel/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color bgColor = Color(0xfff7f6f4);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => firebaseAuth.currentUser != null
                ? StudentHomeScreen()
                : LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.28,
                  ),
                  Image(
                    image: AssetImage(GlobalVariables().appLogo),
                    height: size.height * 0.18,
                  ),
                  SizedBox(height: size.height * 0.000009),
                  Text(
                    '\' ${GlobalVariables().tagLine} \'',
                    style: GoogleFonts.lato(
                      color: Colors.deepPurple,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
