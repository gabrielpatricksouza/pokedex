import '../models/dtos/custom_pokemons_dto.dart';

abstract class AddCustomPokemonsRepository {
  Future<void> call(CustomPokemonDto pokemonDto);
}
  