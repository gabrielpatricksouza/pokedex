import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/storage_firebase_base.dart';

final $ClientStorageFirebase = Bind.lazySingleton(
  (i) => ClientStorageFirebase(),
);

class ClientStorageFirebase extends StorageFirebaseBase {
  final FirebaseStorage _storage;
  ClientStorageFirebase()
      : _storage = FirebaseStorage.instance,
        super(FirebaseStorage.instance);

  FirebaseStorage get storage => _storage;
}
