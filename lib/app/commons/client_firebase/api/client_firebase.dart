import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/client_firebase_base.dart';

final $ClientFirebase = Bind.lazySingleton(
  (i) => ClientFirebase(),
);

class ClientFirebase extends ClientFirebaseBase {
  final FirebaseFirestore _client;
  ClientFirebase() : _client = FirebaseFirestore.instance, super(FirebaseFirestore.instance);
  FirebaseFirestore get client => _client;
}
