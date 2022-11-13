import 'package:eduso/common/features/auth/student_panel/auth/controller/auth_controller.dart';
import 'package:eduso/common/features/auth/student_panel/auth/repository/auth_repostitory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final height;
  final width;
  final text;
  final email;
  final name;
  final studentClass;
  final section;
  final password;
  final confirmPassword;
  final phoneNumber;
  final schoolCode;
  final image;
  ButtonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    this.email = '',
    this.name = '',
    this.studentClass = '',
    this.section = '',
    this.password = '',
    this.confirmPassword = '',
    this.phoneNumber = '',
    this.schoolCode = '',
    this.image = '',
  }) : super(key: key);

  bool isLoading = false;

  void register(BuildContext context) {
    isLoading = true;
    AuthController(
      authRepository: AuthRepository(),
    ).register(
      name,
      studentClass,
      section,
      email,
      password,
      confirmPassword,
      phoneNumber,
      schoolCode,
      image,
      context,
    );
    isLoading = false;
  }

  void login(BuildContext context) {
    AuthController(authRepository: AuthRepository())
        .login(email, password, schoolCode, context);
  }

  void pressed(BuildContext context) {
    if (text == "Register") {
      print('hiii');
      register(context);
    } else if (text == "Login") {
      print('byee');
      login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : CupertinoButton(
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${text}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {
              pressed(context);
            },
          );
  }
}
