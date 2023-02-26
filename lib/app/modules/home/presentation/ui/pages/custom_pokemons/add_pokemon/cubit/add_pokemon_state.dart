part of 'add_pokemon_cubit.dart';

@immutable
abstract class AddPokemonsState {
  const AddPokemonsState();
}

class AddPokemonInitial extends AddPokemonsState {}

class AddPokemonLoading extends AddPokemonsState {}

class AddPokemonFinish extends AddPokemonsState {}

class AddPokemonError extends AddPokemonsState {}
