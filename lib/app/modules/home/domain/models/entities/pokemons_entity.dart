import 'abilities_entity.dart';

class PokemonEntity {
  int? id;
  String? numId;
  String? name;
  String? image;
  List<String>? type;
  List<AbilityEntity>? abilities;

  PokemonEntity(
      {this.id, this.numId, this.name, this.image, this.type, this.abilities});
}
