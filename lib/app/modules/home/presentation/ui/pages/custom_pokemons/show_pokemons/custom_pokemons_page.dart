import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/custom_pokemons_dto.dart';
import 'package:franq/app/modules/home/home_routes.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/error_list.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/loading_list.dart';
import '../../../widgets/card_type.dart';
import '../../../widgets/empty_list.dart';
import 'cubit/custom_pokemon_cubit.dart';

class CustomPokemonsPage extends StatefulWidget {
  const CustomPokemonsPage({Key? key}) : super(key: key);

  @override
  _CustomPokemonsPageState createState() => _CustomPokemonsPageState();
}

class _CustomPokemonsPageState extends State<CustomPokemonsPage> {
  final _controller = Modular.get<CustomPokemonsController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller.getPokemons();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _buildPokemons(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _buildPokemons() {
    return BlocBuilder<CustomPokemonsController, CustomPokemonsState>(
      bloc: _controller,
      builder: (context, state) {
        if (state is CustomPokemonLoading) {
          return const LoadingList();
        } else if (state is CustomPokemonEmpty) {
          return const EmptyList();
        } else if (state is CustomPokemonError) {
          return const ErrorList();
        } else {
          return _buildListPokemons(state.pokemonsList);
        }
      },
    );
  }

  Widget _buildListPokemons(List<CustomPokemonDto> pokemonsList) {
    return ListView.builder(
      itemCount: pokemonsList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        final pokemon = pokemonsList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              HomeRoutes.goToPokemonPage(pokemon);
            },
            title: Text(
              pokemon.name ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: CardTypeList(
              listTypes: pokemon.type ?? [],
            ),
            leading: Image.network(
              pokemon.image!,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).highlightColor,
      onPressed: () async {
        await HomeRoutes.goToAddPokemonPage().whenComplete(
          () async {
            await _controller.getPokemons();
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
