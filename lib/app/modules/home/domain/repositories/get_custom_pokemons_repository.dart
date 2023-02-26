
import '../models/dtos/custom_pokemons_dto.dart';

abstract class GetCustomPokemonsRepository {
  Future<List<CustomPokemonDto>> call();
}
  