import 'dart:io';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/models/entities/custom_pokemon_entity.dart';
import '../entities/abilities_entity.dart';

class CustomPokemonDto extends CustomPokemonEntity implements GetPokemonDto {
  CustomPokemonDto(
    String? name,
    String? image,
    File? uploadImage,
    List<String>? type,
    List<AbilityEntity>? abilities,
  ) : super(
          name: name,
          image: image,
          uploadImage: uploadImage,
          type: type,
          abilities: abilities,
        );

  CustomPokemonDto.fromMap(Map<String, dynamic>? json) {
    name = json?['name'];
    type = (json?['type'] as List<dynamic>).map((e) => e as String).toList();
    abilities = (json?['abilities'] as List<dynamic>)
        .map((e) => AbilityEntity(name: e))
        .toList();
    image = json?['image'] ?? 'https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png?20091205084734';
  }

  Map<String, dynamic> toJson(String image) {
    List<String> abilitiesList = [];
    if (abilities != null) {
      abilities?.forEach((element) {
        abilitiesList.add(element.name ?? '');
      });
    }
    return {
      "name": name,
      "image": image,
      "type": type,
      "abilities": abilitiesList,
    };
  }

  @override
  int? id;

  @override
  String? numId;
}
