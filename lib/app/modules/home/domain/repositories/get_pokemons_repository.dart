import '../models/dtos/pokemons_dto.dart';

abstract class GetPokemonsRepository {
  Future<List<GetPokemonDto>> call();
}
  