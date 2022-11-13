import 'dart:io';

import 'package:eduso/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageRepository {
  String downloadUrl = '';

  Future<String> putFileToStorage(File? file, String path, String uid) async {
    try {
      final ref =
          firebaseStorage.ref().child(path).child('students').child(uid);

      UploadTask uploadTask = ref.putFile(file!);

      final snapshot = await uploadTask;

      final url = await snapshot.ref.getDownloadURL();
      downloadUrl = url;
      print('${url} this is the url');
      Fluttertoast.showToast(msg: 'Image added successfully!');
      return await downloadUrl;
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    return await downloadUrl;
  }
}
