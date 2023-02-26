import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/custom_pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/usecases/add_custom_pokemons_usecase.dart';
import 'package:franq/app/modules/home/home_routes.dart';
part 'add_pokemon_state.dart';

final $AddPokemonsController = Bind.factory(
  (i) => AddPokemonsController(
    i.get(),
  ),
);

class AddPokemonsController extends Cubit<AddPokemonsState> {
  final AddCustomPokemonsUsecase _addCustomPokemonsUsecase;
  AddPokemonsController(
    this._addCustomPokemonsUsecase,
  ) : super(AddPokemonInitial());

  List<CustomPokemonDto> pokemonsList = [];
  CustomPokemonDto? pokemon;

  Future<void> addPokemons(CustomPokemonDto pokemonDto) async {
    emit(AddPokemonLoading());
    try {
      await _addCustomPokemonsUsecase(pokemonDto);
      emit(AddPokemonFinish());
      HomeRoutes.pop();
    } catch (e) {
      debugPrint('getPokemons Error: $e');
      emit(AddPokemonError());
    }
  }
}
