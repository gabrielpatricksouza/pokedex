import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/usecases/get_abilities_usecase.dart';
part 'ability_state.dart';

final $AbilityController = Bind.factory(
  (i) => AbilityController(
    i.get(),
  ),
);

class AbilityController extends Cubit<AbilityState> {
  final GetAbilitiesUsecase _getAbilitiesUsecase;
  AbilityController(this._getAbilitiesUsecase) : super(AbilityInitial());

  GetPokemonDto? pokemon;
  Future<void> selectPokemon(GetPokemonDto value) async {
    try{
      emit(AbilityLoading());
      pokemon = value;
      final ability = await _getAbilitiesUsecase(value.id.toString());
      pokemon?.abilities = ability;
      emit(AbilityFinish());
    }
    catch(e){
      if(value.abilities != null){
        emit(AbilityCustom());
      }
      else{
        debugPrint('selectPokemon Error: $e');
        emit(AbilityError());
      }
    }
  }
}
