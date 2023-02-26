import '../models/dtos/custom_pokemons_dto.dart';

abstract class AddCustomPokemonsUsecase {
  Future<void> call(CustomPokemonDto pokemonDto);
}
  