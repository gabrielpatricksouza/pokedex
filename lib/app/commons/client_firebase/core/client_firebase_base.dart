import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franq/app/commons/shared/request_exception.dart';

abstract class ClientFirebaseBase {
  final FirebaseFirestore _fb;
  ClientFirebaseBase(this._fb);

  Future<Map<String, dynamic>?> get<T>({
    required String collection,
    required String doc,
  }) async {
    try {
      final result = await _fb.collection(collection).doc(doc).get();
      return result.data();
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }

  Future<void> set<T>({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _fb.collection(collection).doc(doc).set(data);
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }

  Future<void> update<T>({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _fb.collection(collection).doc(doc).update(data);
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }

  Future<void> updateList<T>({
    required String collection,
    required String doc,
    required String nameList,
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await _fb.collection(collection).doc(doc).get();
      final list = (result.data()?[nameList] as List);
      list.add(data);
      await _fb.collection(collection).doc(doc).update({nameList: list});
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }

  Future<void> delete<T>({
    required String collection,
    required String doc,
  }) async {
    try {
      await _fb.collection(collection).doc(doc).delete();
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }
}
