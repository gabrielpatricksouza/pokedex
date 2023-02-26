import 'package:flutter_modular/flutter_modular.dart';

import 'api/client_firebase.dart';


class ClientFirebaseModule extends Module {
  @override
  final List<Bind> binds = [
    $ClientFirebase,
  ];

  @override
  final List<ModularRoute> routes = [];
}
