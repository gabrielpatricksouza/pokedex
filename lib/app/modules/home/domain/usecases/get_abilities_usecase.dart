import 'package:franq/app/modules/home/domain/models/dtos/abilities_dto.dart';

abstract class GetAbilitiesUsecase {
  Future<List<AbilitiesDto>> call(String id);
}
  