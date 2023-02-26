import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';
import '../../data/datasources/sign_up_datasource.dart';

final $SignUpImpDatasource = Bind.lazySingleton<SignUpDatasource>(
  (i) => SignUpImpDatasource(i.get<ClientAuthFirebase>()),
);

class SignUpImpDatasource implements SignUpDatasource {
  final ClientAuthFirebase _client;
  SignUpImpDatasource(this._client);

  @override
  Future<void> call(String email, String password) async {
    await _client.signUp(email: email, password: password);
  }
}
  
  