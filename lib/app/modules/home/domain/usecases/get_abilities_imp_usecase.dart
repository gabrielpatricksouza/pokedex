import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/abilities_dto.dart';
import 'get_abilities_usecase.dart';
import '../repositories/get_abilities_repository.dart';

final $GetAbilitiesImpUsecase = Bind.lazySingleton<GetAbilitiesUsecase>(
      (i) => GetAbilitiesImpUsecase(i.get()),
);

class GetAbilitiesImpUsecase implements GetAbilitiesUsecase {
  final GetAbilitiesRepository _getAbilitiesRepository;

  GetAbilitiesImpUsecase(GetAbilitiesRepository getAbilitiesRepository)
      : _getAbilitiesRepository = getAbilitiesRepository;

  @override
  Future<List<AbilitiesDto>> call(String id) async {
    return await _getAbilitiesRepository(id);
  }
}
  