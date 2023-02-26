import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/theme/theme_cubit.dart';
import 'package:franq/app/modules/home/home_routes.dart';
import 'package:franq/app/modules/home/presentation/ui/pages/home/cubit/sign_out_cubit.dart';
import '../custom_pokemons/show_pokemons/custom_pokemons_page.dart';
import '../list_pokemons/pokemons_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controllerLogout = Modular.get<SignOutCubit>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: _buildAppBar(),
        body: const TabBarView(
          children: [
            PokemonsPage(),
            CustomPokemonsPage(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    final theme = ReadContext(context).read<ThemeCubit>();
    return AppBar(
        title: const Text('Podedex'),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              theme.toggleTheme();
            },
            splashRadius: 20.0,
            icon: Icon(
              theme.state is ThemeLight ? Icons.mode_night_sharp : Icons.sunny,
            ),
          ),
          IconButton(
            onPressed: () {
              _controllerLogout.isCompleteSignOut();
              HomeRoutes.goToLogin();
            },
            splashRadius: 20.0,
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
        bottom: const TabBar(
          tabs: [
            Tab(text: 'POKÉMONS',),
            Tab(text: 'CUSTOM POKÉMONS',),
          ],
        )
    );
  }
}
