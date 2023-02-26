import '../../domain/models/dtos/custom_pokemons_dto.dart';

abstract class AddCustomPokemonsDatasource {
  Future<void> call(CustomPokemonDto pokemonDto);
}
  