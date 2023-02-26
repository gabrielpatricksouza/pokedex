import 'package:flutter_test/flutter_test.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/home/data/datasources/get_pokemons_datasource.dart';
import 'package:franq/app/modules/home/data/repositories/get_pokemons_imp_repository.dart';
import 'package:franq/app/modules/home/domain/repositories/get_pokemons_repository.dart';
import 'package:franq/app/modules/home/domain/usecases/get_pokemons_imp_usecase.dart';
import 'package:franq/app/modules/home/domain/usecases/get_pokemons_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_pokemon_test.mocks.dart';

@GenerateMocks([GetPokemonsDatasource])
void main() {
  GetPokemonsDatasource? datasource;
  GetPokemonsRepository? repository;
  GetPokemonsUsecase? usecase;

  setUp(() {
    datasource = MockGetPokemonsDatasource();
    repository = GetPokemonsImpRepository(datasource!);
    usecase = GetPokemonsImpUsecase(repository!);
  });

  test('Success_Get_Pokemon', () async {
    when(datasource!()).thenAnswer((_) => Future.value(mockData));
    final resultPresentation = await usecase!();

    expect(resultPresentation.first.id, 1);
    expect(resultPresentation.first.name, "Bulbasaur");
  });

  test('Exception_Get_Pokemon', () async {
    when(datasource!()).thenAnswer((_) => Future.value(null));

    expect(() async {
      await usecase!();
    }, throwsA(isA<RequestException>()));
  });
}

const mockData = {
  "pokemon": [
    {
      "id": 1,
      "num": "001",
      "name": "Bulbasaur",
      "type": ["Grass", "Poison"],
    }
  ]
};
