import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_datasource.dart';

final $SignUpImpRepository = Bind.lazySingleton<SignUpRepository>(
  (i) => SignUpImpRepository(i.get()),
);

class SignUpImpRepository implements SignUpRepository {
  final SignUpDatasource _signUpDatasource;

  SignUpImpRepository(SignUpDatasource signUpDatasource)
      : _signUpDatasource = signUpDatasource;

  @override
  Future<void> call(String email, String password) async {
    try{
      await _signUpDatasource(email, password);
    }
    on RequestException catch (error) {
      String errorMessage;
      switch (error.message) {
        case "weak-password":
          errorMessage = "Weak password!";
          break;

        case "invalid-email":
          errorMessage = "The value provided for the email user property is invalid!";
          break;

        case "email-already-exists":
          errorMessage = "The email provided is already in use by another user.";
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
  