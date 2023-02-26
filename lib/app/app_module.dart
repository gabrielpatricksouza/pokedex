import 'package:flutter_modular/flutter_modular.dart';
import 'commons/client_firebase/api/auth_firebase.dart';
import 'commons/client_firebase/api/client_firebase.dart';
import 'commons/client_firebase/api/storage_firebase.dart';
import 'commons/client_http/api/client_https.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    $ClientHttps,
    $ClientFirebase,
    $ClientAuthFirebase,
    $ClientStorageFirebase,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];

}