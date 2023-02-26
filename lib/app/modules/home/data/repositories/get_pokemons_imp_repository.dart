
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import '../../domain/repositories/get_pokemons_repository.dart';
import '../datasources/get_pokemons_datasource.dart';

final $GetPokemonsImpRepository = Bind.lazySingleton<GetPokemonsRepository>(
  (i) => GetPokemonsImpRepository(i.get()),
);

class GetPokemonsImpRepository implements GetPokemonsRepository {
  final GetPokemonsDatasource _getPokemonsDatasource;

  GetPokemonsImpRepository(GetPokemonsDatasource getPokemonsDatasource)
      : _getPokemonsDatasource = getPokemonsDatasource;

  @override
  Future<List<GetPokemonDto>> call() async {
    try {
      final json = await _getPokemonsDatasource();
      final list = (json?['pokemon'] as List<dynamic>);
      return list.map((e) => GetPokemonDto.fromMap(e)).toList();
    } catch (exception) {
      throw RequestException(
        message: 'Ocorreu um erro desconhecido, tente novamente mais tarde!',
      );
    }
  }
}
