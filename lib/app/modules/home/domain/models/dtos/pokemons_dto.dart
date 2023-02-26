import 'package:franq/app/modules/home/domain/models/entities/pokemons_entity.dart';
import '../entities/abilities_entity.dart';

class GetPokemonDto extends PokemonEntity {
  GetPokemonDto(
    int? id,
    String? numId,
    String? name,
    String? image,
    List<String>? type,
    List<AbilityEntity>? abilities,
  ) : super(
          id: id,
          numId: numId,
          name: name,
          image: image,
          type: type,
          abilities: abilities,
        );

  GetPokemonDto.fromMap(Map<String, dynamic>? json) {
    id = json?['id'];
    numId = json?['num'];
    name = json?['name'];
    type = (json?['type'] as List<dynamic>).map((e) => e as String).toList();
    image =
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numId.png';
  }
}
