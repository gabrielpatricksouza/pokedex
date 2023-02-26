import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';

final $AuthCubit = Bind.factory(
  (i) => AuthCubit(
    i.get<ClientAuthFirebase>(),
  ),
);

class AuthCubit extends Cubit<bool> {
  final ClientAuthFirebase _auth;
  AuthCubit(this._auth) : super(false);

  void isLoggedUser() {
    emit(_auth.isLogged);
  }
}
