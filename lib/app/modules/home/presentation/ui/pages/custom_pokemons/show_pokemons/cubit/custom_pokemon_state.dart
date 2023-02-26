part of 'custom_pokemon_cubit.dart';

@immutable
abstract class CustomPokemonsState {
  final List<CustomPokemonDto> pokemonsList;
  const CustomPokemonsState({required this.pokemonsList});
}

class CustomPokemonInitial extends CustomPokemonsState {
  CustomPokemonInitial() : super(pokemonsList: []);
}

class CustomPokemonLoading extends CustomPokemonsState {
  CustomPokemonLoading() : super(pokemonsList: []);
}

class CustomPokemonFinish extends CustomPokemonsState {
  const CustomPokemonFinish({required List<CustomPokemonDto> pokemonsList})
      : super(pokemonsList: pokemonsList);
}

class CustomPokemonEmpty extends CustomPokemonsState {
  CustomPokemonEmpty() : super(pokemonsList: []);
}

class CustomPokemonError extends CustomPokemonsState {
  CustomPokemonError() : super(pokemonsList: []);
}
