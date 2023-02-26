import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/home/domain/models/dtos/abilities_dto.dart';
import '../../domain/repositories/get_abilities_repository.dart';
import '../datasources/get_abilities_datasource.dart';

final $GetAbilitiesImpRepository = Bind.lazySingleton<GetAbilitiesRepository>(
      (i) => GetAbilitiesImpRepository(i.get()),
);

class GetAbilitiesImpRepository implements GetAbilitiesRepository {
  final GetAbilitiesDatasource _getAbilitiesDatasource;

  GetAbilitiesImpRepository(GetAbilitiesDatasource getAbilitiesDatasource)
      : _getAbilitiesDatasource = getAbilitiesDatasource;

  @override
  Future<List<AbilitiesDto>> call(String id) async {
    try {
      final json = await _getAbilitiesDatasource(id);
      final list = (json?['abilities'] as List<dynamic>);
      return list.map((e) => AbilitiesDto.fromMap(e['ability'])).toList();
    } catch (exception) {
      throw RequestException(
        message: 'Ocorreu um erro desconhecido, tente novamente mais tarde!',
      );
    }
  }
}
  