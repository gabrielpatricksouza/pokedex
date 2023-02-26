part of 'pokemons_cubit.dart';

@immutable
abstract class PokemonsState {
  final List<GetPokemonDto> pokemonsList;
  const PokemonsState({required this.pokemonsList});
}

class PokemonsInitial extends PokemonsState {
  PokemonsInitial() : super(pokemonsList: []);
}

class PokemonsLoading extends PokemonsState {
  PokemonsLoading() : super(pokemonsList: []);
}

class PokemonsFinish extends PokemonsState {
  const PokemonsFinish({required List<GetPokemonDto> pokemonsList})
      : super(pokemonsList: pokemonsList);
}

class PokemonsError extends PokemonsState {
  PokemonsError() : super(pokemonsList: []);
}
