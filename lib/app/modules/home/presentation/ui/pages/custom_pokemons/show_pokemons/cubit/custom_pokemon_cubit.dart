import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/shared/request_exception.dart';
import 'package:franq/app/modules/home/domain/models/dtos/custom_pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/usecases/get_custom_pokemons_usecase.dart';
part 'custom_pokemon_state.dart';

final $CustomPokemonsController = Bind.factory(
  (i) => CustomPokemonsController(
    i.get(),
  ),
);

class CustomPokemonsController extends Cubit<CustomPokemonsState> {
  final GetCustomPokemonsUsecase _getPokemonsUsecase;
  CustomPokemonsController(
    this._getPokemonsUsecase,
  ) : super(CustomPokemonInitial());

  List<CustomPokemonDto> pokemonsList = [];
  CustomPokemonDto? pokemon;

  Future<void> getPokemons() async {
    emit(CustomPokemonLoading());
    try {
      pokemonsList.clear();
      pokemonsList.addAll(await _getPokemonsUsecase());
      if (pokemonsList.isEmpty) {
        emit(CustomPokemonEmpty());
      } else {
        emit(CustomPokemonFinish(pokemonsList: pokemonsList));
      }
    } on RequestException catch (e) {
      debugPrint('getPokemons Error: ${e.message}');
      emit(CustomPokemonError());
    }
  }
}
