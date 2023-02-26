import 'dart:io';

import 'abilities_entity.dart';

class CustomPokemonEntity {
  String? name;
  String? image;
  File? uploadImage;
  List<String>? type;
  List<AbilityEntity>? abilities;

  CustomPokemonEntity({this.name, this.image, this.type, this.abilities, this.uploadImage});
}
