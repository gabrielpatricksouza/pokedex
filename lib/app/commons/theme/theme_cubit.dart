import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:franq/app/commons/theme/theme_settings.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());

  void toggleTheme() {
    final newTheme = state is ThemeLight ? ThemeDark() : ThemeLight();
    emit(newTheme);
  }
}
