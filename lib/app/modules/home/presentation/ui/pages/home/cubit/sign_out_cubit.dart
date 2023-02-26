import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';

final $SignOutCubit = Bind.factory(
  (i) => SignOutCubit(
    i.get<ClientAuthFirebase>(),
  ),
);

class SignOutCubit extends Cubit<bool> {
  final ClientAuthFirebase _auth;
  SignOutCubit(this._auth) : super(false);

  void isCompleteSignOut() async {
    emit(await _auth.isSuccessSignOut);
  }
}
