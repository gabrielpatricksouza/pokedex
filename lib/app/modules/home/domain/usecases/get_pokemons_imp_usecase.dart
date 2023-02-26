import 'package:flutter_modular/flutter_modular.dart';
import '../models/dtos/pokemons_dto.dart';
import 'get_pokemons_usecase.dart';
import '../repositories/get_pokemons_repository.dart';

final $GetPokemonsImpUsecase = Bind.lazySingleton<GetPokemonsUsecase>(
  (i) => GetPokemonsImpUsecase(i.get()),
);

class GetPokemonsImpUsecase implements GetPokemonsUsecase {
  final GetPokemonsRepository _getPokemonsRepository;

  GetPokemonsImpUsecase(GetPokemonsRepository getPokemonsRepository)
      : _getPokemonsRepository = getPokemonsRepository;

  @override
  Future<List<GetPokemonDto>> call() async {
    return await _getPokemonsRepository();
  }
}
