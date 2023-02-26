import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import 'package:franq/app/modules/home/home_routes.dart';
import 'package:franq/app/modules/home/presentation/ui/pages/list_pokemons/cubit/pokemons_cubit.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/card_type.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/error_list.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/loading_list.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final _controller = Modular.get<PokemonsController>();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocBuilder<PokemonsController, PokemonsState>(
            bloc: _controller,
            builder: (context, state) {
              if (state is PokemonsLoading) {
              } else if (state is PokemonsError) {
                const ErrorList();
              } else {
                return _buildListPokemons(state.pokemonsList);
              }
              return const LoadingList();
            },
          )),
    );
  }

  Widget _buildListPokemons(List<GetPokemonDto> pokemonsList) {
    return ListView.builder(
      itemExtent: 80.0,
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
            leading: _buildLazyImage(pokemon.image),
          ),
        );
      },
    );
  }

  Widget _buildLazyImage(String? imageUrl) {
    return SizedBox(
      width: 60,
      height: 60,
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const LoadingList();
              },
            )
          : const Placeholder(),
    );
  }
}
