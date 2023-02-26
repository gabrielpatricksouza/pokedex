import 'package:flutter_modular/flutter_modular.dart';

import 'api/client_https.dart';


class ClientHttpsModule extends Module {
  @override
  final List<Bind> binds = [
    $ClientHttps,
  ];

  @override
  final List<ModularRoute> routes = [];
}
