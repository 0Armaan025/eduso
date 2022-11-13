import 'dart:io';

import 'package:eduso/common/features/auth/student_panel/auth/repository/auth_repostitory.dart';
import 'package:eduso/common/features/auth/student_panel/auth/repository/storage_repository.dart';

class StorageController {
  Future<String> uploadFile(File? file, String path, String uid) async {
    String downloadUrl =
        await StorageRepository().putFileToStorage(file, path, uid);

    return await downloadUrl;
  }
}
