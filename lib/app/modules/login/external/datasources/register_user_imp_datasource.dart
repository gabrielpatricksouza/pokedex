import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/client_firebase.dart';
import 'package:franq/app/commons/shared/firebase_collections.dart';
import '../../../../commons/client_firebase/api/auth_firebase.dart';
import '../../data/datasources/register_user_datasource.dart';

final $RegisterUserImpDatasource = Bind.lazySingleton<RegisterUserDatasource>(
  (i) => RegisterUserImpDatasource(
    i.get<ClientAuthFirebase>(),
    i.get<ClientFirebase>(),
  ),
);

class RegisterUserImpDatasource implements RegisterUserDatasource {
  final ClientAuthFirebase _auth;
  final ClientFirebase _client;
  RegisterUserImpDatasource(this._auth, this._client);

  @override
  Future<void> call() async {
    await _client.set(
      collection: FirebaseCloud.userCollection,
      doc: _auth.auth.currentUser!.uid,
      data: {
        'name': _auth.auth.currentUser?.email?.split('@').first ?? '',
        'email': _auth.auth.currentUser?.email ?? '',
        'uid': _auth.auth.currentUser?.uid ?? '',
      },
    );
  }
}
