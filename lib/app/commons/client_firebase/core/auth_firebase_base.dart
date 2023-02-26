import 'package:firebase_auth/firebase_auth.dart';
import 'package:franq/app/commons/shared/request_exception.dart';

abstract class ClientAuthFirebaseBase {
  final FirebaseAuth _fb;
  ClientAuthFirebaseBase(this._fb);

  Future<User?> signIn<T>({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _fb.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseException catch (e) {
      throw RequestException(message: e.code);
    }
  }

  Future<User?> signUp<T>({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _fb.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseException catch (e) {
      throw RequestException(message: e.code);
    }
  }

  Future<void> signOut<T>() async {
    try {
      await _fb.signOut();
    } on FirebaseException catch (e) {
      throw RequestException(message: e.message ?? '');
    }
  }
}
