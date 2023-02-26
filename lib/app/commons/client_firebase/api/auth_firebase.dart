import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/auth_firebase_base.dart';

final $ClientAuthFirebase = Bind.lazySingleton(
  (i) => ClientAuthFirebase(),
);

class ClientAuthFirebase extends ClientAuthFirebaseBase {
  final FirebaseAuth _auth;
  ClientAuthFirebase() : _auth = FirebaseAuth.instance, super(FirebaseAuth.instance);

  FirebaseAuth get auth => _auth;

  bool get isLogged => _auth.currentUser != null;

  Future<bool> get isSuccessSignOut async {
    await _auth.signOut();
    return true;
  }
}
