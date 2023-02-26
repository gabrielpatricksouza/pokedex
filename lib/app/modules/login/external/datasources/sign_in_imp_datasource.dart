import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';
import 'package:franq/app/commons/client_firebase/core/auth_firebase_base.dart';
import '../../data/datasources/sign_in_datasource.dart';

final $SignInImpDatasource = Bind.lazySingleton<SignInDatasource>(
  (i) => SignInImpDatasource(i.get<ClientAuthFirebase>()),
);

class SignInImpDatasource implements SignInDatasource {
  final ClientAuthFirebaseBase _client;
  SignInImpDatasource(this._client);

  @override
  Future<void> call(String email, String password) async {
    await _client.signIn(email: email, password: password);
  }
}
  
  