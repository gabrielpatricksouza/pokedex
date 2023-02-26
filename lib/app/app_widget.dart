import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'commons/theme/theme_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Pokemon',
            debugShowCheckedModeBanner: false,
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
            theme: state.themeData,
          );
        }
      ),
    );
  }
}