part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class ThemeLight extends ThemeState {
  ThemeLight() : super (SettingsTheme.getLightTheme());
}

class ThemeDark extends ThemeState {
  ThemeDark() : super (SettingsTheme.getDarkTheme());
}
