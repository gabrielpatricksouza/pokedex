import 'package:flutter_modular/flutter_modular.dart';
import 'register_user_usecase.dart';
import '../repositories/register_user_repository.dart';

final $RegisterUserImpUsecase = Bind.lazySingleton<RegisterUserUsecase>(
  (i) => RegisterUserImpUsecase(i.get()),
);

class RegisterUserImpUsecase implements RegisterUserUsecase {
  final RegisterUserRepository _registerUserRepository;

  RegisterUserImpUsecase(RegisterUserRepository registerUserRepository)
      : _registerUserRepository = registerUserRepository;

  @override
  Future<void> call() async {
    return await _registerUserRepository();
  }
}
  