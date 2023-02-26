import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/login/domain/usecases/register_user_usecase.dart';
import 'package:franq/app/modules/login/domain/usecases/sign_in_usecase.dart';
import 'package:franq/app/modules/login/domain/usecases/sign_up_usecase.dart';
part 'login_in_state.dart';

final $LoginController = Bind.factory(
  (i) => LoginController(
    i.get(),
    i.get(),
    i.get(),
  ),
);

class LoginController extends Cubit<LoginState> {
  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;
  final RegisterUserUsecase _registerUserUsecase;
  LoginController(
    this._signInUsecase,
    this._signUpUsecase,
    this._registerUserUsecase,
  ) : super(LoginInitial());

  String messageError = '';

  Future<bool> signIn(String email, String password) async {
    try {
      emit(LoginLoading());
      await _signInUsecase(email, password);
      emit(LoginFinish());
      return true;
    } on RequestException catch (e) {
      messageError = e.message;
      emit(LoginError());
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      emit(LoginLoading());
      await _signUpUsecase(email, password);
      await _registerUserUsecase();
      emit(LoginFinish());
      return true;
    } on RequestException catch (e) {
      messageError = e.message;
      emit(LoginError());
      return false;
    }
  }
}
