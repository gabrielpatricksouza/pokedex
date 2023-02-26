import '../models/dtos/custom_pokemons_dto.dart';

abstract class GetCustomPokemonsUsecase {
  Future<List<CustomPokemonDto>> call();
}
  