import 'package:flutter_test/flutter_test.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/home/data/datasources/get_abilities_datasource.dart';
import 'package:franq/app/modules/home/data/repositories/get_abilities_imp_repository.dart';
import 'package:franq/app/modules/home/domain/repositories/get_abilities_repository.dart';
import 'package:franq/app/modules/home/domain/usecases/get_abilities_imp_usecase.dart';
import 'package:franq/app/modules/home/domain/usecases/get_abilities_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_abilities_test.mocks.dart';

@GenerateMocks([GetAbilitiesDatasource])
void main() {
  GetAbilitiesDatasource? datasource;
  GetAbilitiesRepository? repository;
  GetAbilitiesUsecase? usecase;

  setUp(() {
    datasource = MockGetAbilitiesDatasource();
    repository = GetAbilitiesImpRepository(datasource!);
    usecase = GetAbilitiesImpUsecase(repository!);
  });

  test('Success_Get_Ability', () async {
    when(datasource!('1')).thenAnswer((_) => Future.value(mockData));
    final resultPresentation = await usecase!('1');

    expect(resultPresentation.first.name, "overgrow");
  });

  test('Exception_Get_Ability', () async {
    when(datasource!('1')).thenAnswer((_) => Future.value(null));

    expect(() async {
      await usecase!('1');
    }, throwsA(isA<RequestException>()));
  });
}

const mockData = {
  "abilities": [
    {
      "ability": {
        "name": "overgrow",
        "url": "https://pokeapi.co/api/v2/ability/65/"
      },
      "is_hidden": false,
      "slot": 1
    }
  ]
};
