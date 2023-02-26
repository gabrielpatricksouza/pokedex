import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/presentation/ui/pages/custom_pokemons/show_pokemons/cubit/custom_pokemon_cubit.dart';
import 'data/repositories/add_custom_pokemons_imp_repository.dart';
import 'domain/usecases/add_custom_pokemons_imp_usecase.dart';
import 'external/datasources/add_custom_pokemons_imp_datasource.dart';
import 'data/repositories/get_custom_pokemons_imp_repository.dart';
import 'domain/usecases/get_custom_pokemons_imp_usecase.dart';
import 'external/datasources/get_custom_pokemons_imp_datasource.dart';
import 'package:franq/app/modules/home/presentation/ui/pages/selected_pokemon/cubit/ability_cubit.dart';
import 'external/datasources/get_abilities_imp_datasource.dart';
import 'data/repositories/get_abilities_imp_repository.dart';
import 'domain/usecases/get_abilities_imp_usecase.dart';
import 'presentation/ui/pages/custom_pokemons/add_pokemon/add_pokemon_page.dart';
import 'presentation/ui/pages/custom_pokemons/add_pokemon/cubit/add_pokemon_cubit.dart';
import 'presentation/ui/pages/list_pokemons/cubit/pokemons_cubit.dart';
import 'presentation/ui/pages/home/cubit/sign_out_cubit.dart';
import 'presentation/ui/pages/home/home_page.dart';
import 'external/datasources/get_pokemons_imp_datasource.dart';
import 'data/repositories/get_pokemons_imp_repository.dart';
import 'domain/usecases/get_pokemons_imp_usecase.dart';
import 'presentation/ui/pages/selected_pokemon/select_pokemon_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [

    //Usecases
    $GetPokemonsImpUsecase,
    $GetCustomPokemonsImpUsecase,
    $AddCustomPokemonsImpUsecase,
    $GetAbilitiesImpUsecase,

    //Repository
    $GetPokemonsImpRepository,
    $GetCustomPokemonsImpRepository,
    $AddCustomPokemonsImpRepository,
    $GetAbilitiesImpRepository,

    //Datasource
    $GetCustomPokemonsImpDatasource,
    $GetPokemonsImpDatasource,
    $AddCustomPokemonsImpDatasource,
    $GetAbilitiesImpDatasource,

    //Controller
    $PokemonsController,
    $CustomPokemonsController,
    $AddPokemonsController,
    $AbilityController,
    $SignOutCubit,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const HomePage(),
      transition: TransitionType.size,
    ),
    ChildRoute(
      '/pokemon',
      child: (context, args) => PokemonPage(
        pokemon: args.data,
      ),
      transition: TransitionType.downToUp,
    ),

    ChildRoute(
      '/add-pokemon',
      child: (context, args) => const AddPokemonPage(),
      transition: TransitionType.downToUp,
    ),
  ];
}
