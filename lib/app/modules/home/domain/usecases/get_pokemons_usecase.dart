import '../models/dtos/pokemons_dto.dart';

abstract class GetPokemonsUsecase {
  Future<List<GetPokemonDto>> call();
}
  