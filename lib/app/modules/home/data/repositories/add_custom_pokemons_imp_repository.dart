import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/models/dtos/custom_pokemons_dto.dart';
import '../../domain/repositories/add_custom_pokemons_repository.dart';
import '../datasources/add_custom_pokemons_datasource.dart';

final $AddCustomPokemonsImpRepository = Bind.lazySingleton<AddCustomPokemonsRepository>(
  (i) => AddCustomPokemonsImpRepository(i.get()),
);

class AddCustomPokemonsImpRepository implements AddCustomPokemonsRepository {
  final AddCustomPokemonsDatasource _addCustomPokemonsDatasource;

  AddCustomPokemonsImpRepository(AddCustomPokemonsDatasource addCustomPokemonsDatasource)
      : _addCustomPokemonsDatasource = addCustomPokemonsDatasource;

  @override
  Future<void> call(CustomPokemonDto pokemonDto) async {
    return _addCustomPokemonsDatasource(pokemonDto);
  }
}
  