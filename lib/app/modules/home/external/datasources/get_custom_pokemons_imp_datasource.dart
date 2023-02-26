import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';
import 'package:franq/app/commons/client_firebase/api/client_firebase.dart';
import 'package:franq/app/commons/shared/firebase_collections.dart';
import '../../data/datasources/get_custom_pokemons_datasource.dart';

final $GetCustomPokemonsImpDatasource = Bind.lazySingleton<GetCustomPokemonsDatasource>(
  (i) => GetCustomPokemonsImpDatasource(
    i.get<ClientFirebase>(),
    i.get<ClientAuthFirebase>(),
  ),
);

class GetCustomPokemonsImpDatasource implements GetCustomPokemonsDatasource {
  final ClientFirebase _client;
  final ClientAuthFirebase _auth;
  GetCustomPokemonsImpDatasource(this._client, this._auth);

  @override
  Future<Map<String, dynamic>?> call() async {
    return await _client.get(
        collection: FirebaseCloud.userCollection,
        doc: _auth.auth.currentUser!.uid
    );
  }
}
