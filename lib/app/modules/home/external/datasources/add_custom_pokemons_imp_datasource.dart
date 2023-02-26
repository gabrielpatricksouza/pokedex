import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/client_firebase/api/auth_firebase.dart';
import 'package:franq/app/commons/client_firebase/api/client_firebase.dart';
import 'package:franq/app/commons/client_firebase/api/storage_firebase.dart';
import 'package:franq/app/commons/shared/firebase_collections.dart';
import '../../data/datasources/add_custom_pokemons_datasource.dart';
import '../../domain/models/dtos/custom_pokemons_dto.dart';

final $AddCustomPokemonsImpDatasource =
    Bind.lazySingleton<AddCustomPokemonsDatasource>(
  (i) => AddCustomPokemonsImpDatasource(
    i.get<ClientFirebase>(),
    i.get<ClientAuthFirebase>(),
    i.get<ClientStorageFirebase>(),
  ),
);

class AddCustomPokemonsImpDatasource implements AddCustomPokemonsDatasource {
  final ClientFirebase _client;
  final ClientAuthFirebase _auth;
  final ClientStorageFirebase _storage;
  AddCustomPokemonsImpDatasource(this._client, this._auth, this._storage);

  @override
  Future<void> call(CustomPokemonDto pokemonDto) async {
    String? urlImage;
    if (pokemonDto.uploadImage != null) {
      urlImage = await _storage.uploadImage(
        child: FirebaseCloud.pokemonSaveFile,
        path: DateTime.now().microsecondsSinceEpoch.toString(),
        file: pokemonDto.uploadImage!,
      );
    }
    await _client.updateList(
        collection: FirebaseCloud.userCollection,
        doc: _auth.auth.currentUser!.uid,
        nameList: 'pokemons',
        data: pokemonDto.toJson(urlImage ?? ''),
    );
  }
}
