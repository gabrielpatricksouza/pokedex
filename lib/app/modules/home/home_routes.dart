import 'package:flutter_modular/flutter_modular.dart';

import 'domain/models/dtos/custom_pokemons_dto.dart';
import 'domain/models/dtos/pokemons_dto.dart';

class HomeRoutes {

  static goToPokemonPage(GetPokemonDto pokemon){
    Modular.to.pushNamed('/home/pokemon', arguments: pokemon);
  }

  static goToCustomPokemonPage(CustomPokemonDto pokemon){
    Modular.to.pushNamed('/home/custom-pokemon', arguments: pokemon);
  }

  static Future goToAddPokemonPage() async {
    await Modular.to.pushNamed('/home/add-pokemon');
  }

  static goToLogin(){
    Modular.to.navigate('/');
  }

  static pop(){
    Modular.to.pop();
  }
}