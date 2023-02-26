
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:franq/app/commons/shared/request_exception.dart';

abstract class StorageFirebaseBase {
  final FirebaseStorage _storage;
  StorageFirebaseBase(this._storage);

  Future<String?> uploadImage<T>({
    required String child,
    required String path,
    required File file,
  }) async {
    try {
      final firebaseStorageRef = _storage.ref().child(child).child(path);
      final UploadTask task = firebaseStorageRef.putFile(file);
      final TaskSnapshot snapshot = await task.whenComplete(() {});
      if(snapshot.state == TaskState.success) {
        return await firebaseStorageRef.getDownloadURL();
      }
      return '';
    } on FirebaseException catch (e) {
      throw RequestException(message: e.code);
    }
  }
}
