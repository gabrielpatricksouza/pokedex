import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/usecases/get_pokemons_usecase.dart';
part 'pokemons_state.dart';

final $PokemonsController = Bind.factory(
  (i) => PokemonsController(
    i.get(),
  ),
);

class PokemonsController extends Cubit<PokemonsState> {
  final GetPokemonsUsecase _getPokemonsUsecase;
  PokemonsController(
    this._getPokemonsUsecase,
  ) : super(PokemonsInitial());

  List<GetPokemonDto> pokemonsList = [];

  Future<void> getPokemons() async {
    if (state is PokemonsFinish) return;
    emit(PokemonsLoading());
    try {
      pokemonsList.addAll(await _getPokemonsUsecase());
      emit(PokemonsFinish(pokemonsList: pokemonsList));
    } catch (e) {
      debugPrint('getPokemons Error: $e');
      emit(PokemonsError());
    }
  }
}
