import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/design_system/custom_alert.dart';
import 'package:franq/app/commons/theme/theme_cubit.dart';
import 'package:franq/app/modules/home/domain/models/dtos/pokemons_dto.dart';
import 'package:franq/app/modules/home/home_routes.dart';
import 'package:franq/app/modules/home/presentation/ui/pages/selected_pokemon/cubit/ability_cubit.dart';
import '../../widgets/card_type.dart';
import '../../widgets/error_list.dart';
import '../../widgets/loading_list.dart';

class PokemonPage extends StatefulWidget {
  final GetPokemonDto pokemon;
  const PokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final _controller = Modular.get<AbilityController>();

  @override
  void initState() {
    _controller.selectPokemon(widget.pokemon);
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: _decoration(),
        child: SafeArea(
          child: BlocBuilder<AbilityController, AbilityState>(
              bloc: _controller,
              builder: (context, state) {
                return Column(
                  children: [
                    _buildIconClose(state),
                    _buildImage(),
                    _buildTitle(),
                    _buildTypes(),
                    _buildAbilities(state),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Decoration _decoration() {
    final theme = ReadContext(context).read<ThemeCubit>();
    final lightColors = [Colors.pinkAccent, Colors.deepPurpleAccent];
    final darkColors = [Colors.deepPurpleAccent, Colors.pinkAccent];
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: theme.state is ThemeLight ? lightColors : darkColors,
      ),
    );
  }

  Widget _buildIconClose(AbilityState state) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            HomeRoutes.pop();
          },
          icon: const Icon(Icons.close),
        ),
        if (state is AbilityCustom)
          ...[
            const Spacer(),
            IconButton(
              onPressed: () {
                showAlert(context, 'Feature under development');
              },
              icon: const Icon(Icons.edit),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                showAlert(context, 'Feature under development');
              },
              icon: const Icon(Icons.delete_forever_outlined),
              color: Colors.white,
            ),
          ],
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(_controller.pokemon?.image ?? '',
        height: MediaQuery.of(context).size.height * 0.35);
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        _controller.pokemon?.name ?? '',
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTypes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CardTypeList(
        listTypes: _controller.pokemon?.type ?? [],
      ),
    );
  }

  Widget _buildAbilities(AbilityState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Abilities',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (state is AbilityLoading) {
                  return const LoadingList();
                }
                if (state is AbilityError) {
                  return const ErrorList();
                }
                return ListView.builder(
                  itemCount: _controller.pokemon?.abilities?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final name =
                        _controller.pokemon?.abilities?[index].name ?? '';
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
