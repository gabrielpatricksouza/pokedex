import 'package:flutter_modular/flutter_modular.dart';
import '../models/dtos/custom_pokemons_dto.dart';
import 'add_custom_pokemons_usecase.dart';
import '../repositories/add_custom_pokemons_repository.dart';

final $AddCustomPokemonsImpUsecase = Bind.lazySingleton<AddCustomPokemonsUsecase>(
  (i) => AddCustomPokemonsImpUsecase(i.get()),
);

class AddCustomPokemonsImpUsecase implements AddCustomPokemonsUsecase {
  final AddCustomPokemonsRepository _addCustomPokemonsRepository;

  AddCustomPokemonsImpUsecase(AddCustomPokemonsRepository addCustomPokemonsRepository)
      : _addCustomPokemonsRepository = addCustomPokemonsRepository;

  @override
  Future<void> call(CustomPokemonDto pokemonDto) async {
    return _addCustomPokemonsRepository(pokemonDto);
  }
}
  