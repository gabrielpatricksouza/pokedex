import 'package:flutter_modular/flutter_modular.dart';
import '../../commons/client_firebase/api/client_firebase.dart';
import 'data/repositories/register_user_imp_repository.dart';
import 'domain/usecases/register_user_imp_usecase.dart';
import 'external/datasources/register_user_imp_datasource.dart';
import 'external/datasources/sign_up_imp_datasource.dart';
import 'data/repositories/sign_up_imp_repository.dart';
import 'domain/usecases/sign_up_imp_usecase.dart';
import '../../commons/client_firebase/api/auth_firebase.dart';
import 'external/datasources/sign_in_imp_datasource.dart';
import 'data/repositories/sign_in_imp_repository.dart';
import 'domain/usecases/sign_in_imp_usecase.dart';
import 'presentation/ui/pages/sign_in/cubit/auth_cubit.dart';
import 'presentation/ui/pages/sign_in/cubit/login_in_cubit.dart';
import 'presentation/ui/pages/sign_in/sign_in_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [

    //Usecases
    $SignInImpUsecase,
    $SignUpImpUsecase,
    $RegisterUserImpUsecase,

    //Repository
    $SignInImpRepository,
    $SignUpImpRepository,
    $RegisterUserImpRepository,

    //Datasource
    $SignInImpDatasource,
    $SignUpImpDatasource,
    $RegisterUserImpDatasource,

    //Controller
    $LoginController,
    $AuthCubit,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SignInPage()),
  ];
}
