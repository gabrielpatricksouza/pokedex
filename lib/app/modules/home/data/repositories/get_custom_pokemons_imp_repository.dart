import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import '../../domain/models/dtos/custom_pokemons_dto.dart';
import '../../domain/repositories/get_custom_pokemons_repository.dart';
import '../datasources/get_custom_pokemons_datasource.dart';

final $GetCustomPokemonsImpRepository = Bind.lazySingleton<GetCustomPokemonsRepository>(
  (i) => GetCustomPokemonsImpRepository(i.get()),
);

class GetCustomPokemonsImpRepository implements GetCustomPokemonsRepository {
  final GetCustomPokemonsDatasource _getCustomPokemonsDatasource;

  GetCustomPokemonsImpRepository(GetCustomPokemonsDatasource getCustomPokemonsDatasource)
      : _getCustomPokemonsDatasource = getCustomPokemonsDatasource;

  @override
  Future<List<CustomPokemonDto>> call() async {
    try {
      final json = await _getCustomPokemonsDatasource();
      if(json == null)return [];
      final list = (json['pokemons'] as List<dynamic>);
      return list.map((e) => CustomPokemonDto.fromMap(e)).toList();
    } catch (exception) {
      throw RequestException(
        message: 'Ocorreu um erro desconhecido, tente novamente mais tarde!',
      );
    }
  }
}
  