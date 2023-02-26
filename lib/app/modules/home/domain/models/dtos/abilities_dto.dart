import '../entities/abilities_entity.dart';

class AbilitiesDto extends AbilityEntity{
  AbilitiesDto(String? name,) : super(name: name);

  AbilitiesDto.fromMap(Map<String, dynamic>? json) {
    name = json?['name'];
  }
}
