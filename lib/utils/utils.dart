import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

//firebase

final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;
final firestore = FirebaseFirestore.instance;
