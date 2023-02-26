import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import '../../domain/repositories/register_user_repository.dart';
import '../datasources/register_user_datasource.dart';

final $RegisterUserImpRepository = Bind.lazySingleton<RegisterUserRepository>(
  (i) => RegisterUserImpRepository(i.get()),
);

class RegisterUserImpRepository implements RegisterUserRepository {
  final RegisterUserDatasource _registerUserDatasource;

  RegisterUserImpRepository(RegisterUserDatasource registerUserDatasource)
      : _registerUserDatasource = registerUserDatasource;

  @override
  Future<void> call() async {
    try {
      return _registerUserDatasource();
    } catch (e) {
      throw RequestException(
        message: 'An error occurred while registering!',
      );
    }
  }
}
