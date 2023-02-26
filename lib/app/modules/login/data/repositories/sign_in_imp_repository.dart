import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../datasources/sign_in_datasource.dart';

final $SignInImpRepository = Bind.lazySingleton<SignInRepository>(
  (i) => SignInImpRepository(i.get()),
);

class SignInImpRepository implements SignInRepository {
  final SignInDatasource _signInDatasource;

  SignInImpRepository(SignInDatasource signInDatasource)
      : _signInDatasource = signInDatasource;

  @override
  Future<void> call(String email, String password) async {
    try {
      await _signInDatasource(email, password);
    } on RequestException catch (error) {
      String errorMessage;
      switch (error.message) {
        case "wrong-password":
          errorMessage = "Incorrect password!";
          break;

        case "user-not-found":
          errorMessage = "User not found";
          break;

        case "user-disabled":
          errorMessage =
              "Your username has been blocked, please contact support.";
          break;

        case "email-already-in-use":
          errorMessage = "The email provided is already in use by another user.";
          break;

        default:
          errorMessage = "An unknown error has occurred.";
          break;
      }
      throw RequestException(
        message: errorMessage,
      );
    }
  }
}
