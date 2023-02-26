import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'sign_up_usecase.dart';
import '../repositories/sign_up_repository.dart';

final $SignUpImpUsecase = Bind.lazySingleton<SignUpUsecase>(
  (i) => SignUpImpUsecase(i.get()),
);

class SignUpImpUsecase implements SignUpUsecase {
  final SignUpRepository _signUpRepository;

  SignUpImpUsecase(SignUpRepository signUpRepository)
      : _signUpRepository = signUpRepository;

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
      await _signUpRepository(emailTrim, passwordTrim);
    }
  }
}
  