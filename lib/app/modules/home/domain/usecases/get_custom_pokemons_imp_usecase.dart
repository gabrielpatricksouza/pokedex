import 'package:flutter_modular/flutter_modular.dart';
import '../models/dtos/custom_pokemons_dto.dart';
import 'get_custom_pokemons_usecase.dart';
import '../repositories/get_custom_pokemons_repository.dart';

final $GetCustomPokemonsImpUsecase = Bind.lazySingleton<GetCustomPokemonsUsecase>(
  (i) => GetCustomPokemonsImpUsecase(i.get()),
);

class GetCustomPokemonsImpUsecase implements GetCustomPokemonsUsecase {
  final GetCustomPokemonsRepository _getCustomPokemonsRepository;

  GetCustomPokemonsImpUsecase(GetCustomPokemonsRepository getCustomPokemonsRepository)
      : _getCustomPokemonsRepository = getCustomPokemonsRepository;

  @override
  Future<List<CustomPokemonDto>> call() async {
    return await _getCustomPokemonsRepository();
  }
}
  