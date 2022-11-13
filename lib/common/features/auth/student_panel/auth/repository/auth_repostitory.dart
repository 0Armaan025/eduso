import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduso/common/features/auth/student_panel/auth/controller/storage_controller.dart';
import 'package:eduso/common/features/auth/student_panel/auth/models/student.dart';
import 'package:eduso/common/features/auth/student_panel/home/home_screen/screens/student_home_screen.dart';
import 'package:eduso/utils/global_variables.dart';
import 'package:eduso/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthRepository {
  //function to log in a student

  int no = 1234567;
  void logIn(
      String email, String password, String schoolCode, BuildContext context) {
    try {
      if (schoolCode != '1234567') {
        print(schoolCode);
      } else {
        firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StudentHomeScreen()));
        Fluttertoast.showToast(msg: 'Logged In Successfully!');
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  //function to sign up a student

  final currentUserUid = firebaseAuth.currentUser?.uid ?? '';

  void signUp(
    String name,
    String studentClass,
    String section,
    String emailAddress,
    String password,
    String confirmPassword,
    String phoneNumber,
    String schoolCode,
    File? file,
    BuildContext context,
  ) async {
    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      //storage part

      final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      String downloadUrl = await StorageController().uploadFile(
          file, '/profilePictures', firebaseAuth.currentUser?.uid ?? '');

      print('hi');

      firestore
          .collection('classes')
          .doc('${studentClass}th')
          .set({'noOfStudents': 1});

      print('hyyy');

      firestore
          .collection('classes')
          .doc('${studentClass}th')
          .collection('${studentClass}-${section}')
          .doc('students')
          .collection('students')
          .doc(firebaseAuth.currentUser?.uid ?? '')
          .set({
        'profilePicture': downloadUrl,
        'name': name,
      });

      print('hyyyyyyyy');

      print('${studentClass} class');
      print('${section} section');

      firestore
          .collection('classes')
          .doc('${studentClass}th')
          .collection('${studentClass}-${section}')
          .doc('students')
          .collection(firebaseAuth.currentUser?.uid ?? '')
          .doc(firebaseAuth.currentUser?.uid ?? '');

      firestore
          .collection('reports')
          .doc(firebaseAuth.currentUser?.uid ?? '')
          .collection('sampleCollection');

      firestore
          .collection('classes')
          .doc('${studentClass}th')
          .collection('${studentClass}-${section}')
          .doc('students')
          .set({'classTeacherName': ''});

      firestore.collection('students').doc(uid).set({
        'name': name,
        'class': studentClass,
        'section': section,
        'password': password,
        'school': 'SHCS',
        'email': emailAddress,
        'phoneNumber': phoneNumber,
        'classTeacherName': '',
        'uid': uid,
        'remarks': '',
        'classmates': [],
        'profilePicture': downloadUrl,
      }).then((value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StudentHomeScreen()));
      });

      print('made it here');

      print('hey');

      print('success');
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void validateAndRegisterStudent(
    String name,
    String studentClass,
    String section,
    String emailAddress,
    String password,
    String confirmPassword,
    String phoneNumber,
    String schoolCode,
    File? file,
    BuildContext context,
  ) {
    //conditions

    if (int.parse(studentClass) < 1 || int.parse(studentClass) > 12) {
      Fluttertoast.showToast(msg: 'You can only choose class from 1 to 12');
    } else if (password != confirmPassword) {
      Fluttertoast.showToast(msg: 'Your passwords do not match');
    } else {
      //proceed further
      signUp(name, studentClass, section, emailAddress, password,
          confirmPassword, phoneNumber, schoolCode, file, context);
    }
  }

  void registerStudent(
    String name,
    String studentClass,
    String section,
    String emailAddress,
    String password,
    String confirmPassword,
    String phoneNumber,
    String schoolCode,
    File? file,
    BuildContext context,
  ) {
    validateAndRegisterStudent(name, studentClass, section, emailAddress,
        password, confirmPassword, phoneNumber, schoolCode, file, context);
  }
}
