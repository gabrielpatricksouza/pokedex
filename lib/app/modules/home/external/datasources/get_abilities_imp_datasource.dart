import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_http/core/client_https_base.dart';
import '../../../../commons/client_http/api/client_https.dart';
import '../../data/datasources/get_abilities_datasource.dart';

final $GetAbilitiesImpDatasource = Bind.lazySingleton<GetAbilitiesDatasource>(
  (i) => GetAbilitiesImpDatasource(i.get<ClientHttps>()),
);

class GetAbilitiesImpDatasource implements GetAbilitiesDatasource {
  final ClientHttpsBase _client;
  GetAbilitiesImpDatasource(this._client);

  @override
  Future<Map<String, dynamic>?> call(String id) async {
    final response = await _client.get(
        'https://pokeapi.co/api/v2/pokemon/$id/');
    return jsonDecode(response.body);
  }
}
