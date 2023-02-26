import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'sign_in_usecase.dart';
import '../repositories/sign_in_repository.dart';

final $SignInImpUsecase = Bind.lazySingleton<SignInUsecase>(
  (i) => SignInImpUsecase(i.get()),
);

class SignInImpUsecase implements SignInUsecase {
  final SignInRepository _signInRepository;

  SignInImpUsecase(SignInRepository signInRepository)
      : _signInRepository = signInRepository;

  @override
  Future<void> call(String email, String password) async {
    final emailTrim = email.trim();
    final passwordTrim = password.trim();
    if(emailTrim.isEmpty || passwordTrim.isEmpty){
      throw RequestException(
        message: 'The fields are empty',
      );
    }
    else {
      await _signInRepository(emailTrim, passwordTrim);
    }
  }
}
  