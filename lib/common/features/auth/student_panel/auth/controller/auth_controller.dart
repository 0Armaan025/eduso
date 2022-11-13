import 'dart:io';

import 'package:eduso/common/features/auth/student_panel/auth/repository/auth_repostitory.dart';
import 'package:eduso/common/features/auth/student_panel/home/home_screen/screens/student_home_screen.dart';
import 'package:flutter/material.dart';

class AuthController {
  //function to sign up

  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void login(
      String email, String pass, String schoolCode, BuildContext context) {
    authRepository.logIn(email, pass, schoolCode, context);
  }

  void register(
      String name,
      String studentClass,
      String section,
      String emailAddress,
      String password,
      String confirmPassword,
      String phoneNumber,
      String schoolCode,
      File? file,
      BuildContext context) {
    authRepository.registerStudent(name, studentClass, section, emailAddress,
        password, confirmPassword, phoneNumber, schoolCode, file, context);
  }
}
