import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:franq/app/commons/design_system/custom_alert.dart';
import 'package:franq/app/commons/design_system/custom_animated_button.dart';
import 'package:franq/app/commons/design_system/custom_text_field.dart';
import 'package:franq/app/commons/shared/abilities_pokemon.dart';
import 'package:franq/app/commons/theme/theme_cubit.dart';
import 'package:franq/app/modules/home/domain/models/dtos/custom_pokemons_dto.dart';
import 'package:franq/app/modules/home/domain/models/entities/abilities_entity.dart';
import 'package:franq/app/modules/home/home_routes.dart';
import 'package:franq/app/modules/home/presentation/ui/widgets/error_added.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/card_type.dart';
import 'cubit/add_pokemon_cubit.dart';

class AddPokemonPage extends StatefulWidget {
  const AddPokemonPage({Key? key}) : super(key: key);

  @override
  State<AddPokemonPage> createState() => _AddPokemonPageState();
}

class _AddPokemonPageState extends State<AddPokemonPage> {
  final _controller = Modular.get<AddPokemonsController>();
  final _pokemonName = TextEditingController();
  File? uploadImage;

  List<String> abilities = [];
  List<String> selectedAbilities = [];

  @override
  void initState() {
    _addAbilities();
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: _decoration(),
        child: SafeArea(
          child: BlocBuilder<AddPokemonsController, AddPokemonsState>(
              bloc: _controller,
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildIconClose(),
                          _buildSelectImage(),
                          _buildInputTitle(),
                          _buildTypes(),
                          _buildAbilities(),
                        ],
                      ),
                    ),
                    if (state is AddPokemonLoading)
                      const LinearProgressIndicator(color: Colors.white)
                    else if (state is AddPokemonError)
                      const ErrorAdded()
                    else
                      _savePokemon(),
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

  Widget _buildIconClose() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          HomeRoutes.pop();
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  Widget _buildSelectImage() {
    return GestureDetector(
      onTap: () async {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          uploadImage = File(pickedFile.path);
        }
        setState(() {});
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: uploadImage == null ? _uploadImage() : _showUploadImage()),
    );
  }

  Widget _uploadImage() {
    return const Center(
      child: Icon(
        Icons.file_upload_outlined,
        size: 100.0,
      ),
    );
  }

  Widget _showUploadImage() {
    return Center(
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.17,
        backgroundImage: FileImage(
          uploadImage!,
        ),
      ),
    );
  }

  Widget _buildInputTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomTextField(
        hintText: 'Pokemon name',
        icon: Icon(
          Icons.catching_pokemon_outlined,
          color: Colors.grey[700],
        ),
        textInputType: TextInputType.emailAddress,
        controller: _pokemonName,
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

  Widget _buildAbilities() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Abilities',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: abilities.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                final name = abilities[index];
                return GestureDetector(
                  onTap: () {
                    _selectAbilities(name);
                  },
                  child: Card(
                    color: selectedAbilities.contains(name)
                        ? Colors.amber
                        : Colors.white,
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _savePokemon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: CustomAnimatedButton(
        onTap: () async {
          final verify = await _verifyDataPokemon();
          if (verify) {
            final abilities =
                selectedAbilities.map((e) => AbilityEntity(name: e)).toList();
            final pokemonData = CustomPokemonDto(
              _pokemonName.text.trim(),
              '',
              uploadImage,
              ['Custom'],
              abilities,
            );
            await _controller.addPokemons(pokemonData);
          }
        },
        widhtMultiply: 1,
        height: 53,
        colorText: Colors.white,
        color: Colors.pinkAccent,
        text: "SAVE POKEMON",
      ),
    );
  }

  Future<bool> _verifyDataPokemon() async {
    if (uploadImage == null) {
      await showAlert(context, "Insert an image for your pokemon");
      return false;
    } else if (_pokemonName.text.trim().isEmpty) {
      await showAlert(context, "Enter your pokemon's name");
      return false;
    } else if (selectedAbilities.length < 3) {
      await showAlert(context, "Select at least 3 skills");
      return false;
    }
    return true;
  }

  void _addAbilities() {
    abilities.addAll(CustomAbilities.get());
    setState(() {});
  }

  void _selectAbilities(String ability) {
    if (selectedAbilities.contains(ability)) {
      selectedAbilities.remove(ability);
    } else {
      selectedAbilities.add(ability);
    }
    setState(() {});
  }
}
