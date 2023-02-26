import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_http/api/client_https.dart';
import 'package:franq/app/commons/client_http/core/client_https_base.dart';
import '../../data/datasources/get_pokemons_datasource.dart';

final $GetPokemonsImpDatasource = Bind.lazySingleton<GetPokemonsDatasource>(
  (i) => GetPokemonsImpDatasource(i.get<ClientHttps>()),
);

class GetPokemonsImpDatasource implements GetPokemonsDatasource {
  final ClientHttpsBase _client;
  GetPokemonsImpDatasource(this._client);

  @override
  Future<Map<String, dynamic>?> call() async {
    final response = await _client.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    return jsonDecode(response.body);
  }
}
