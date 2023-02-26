import '../models/dtos/abilities_dto.dart';

abstract class GetAbilitiesRepository {
  Future<List<AbilitiesDto>> call(String id);
}
  