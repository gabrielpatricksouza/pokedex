import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsTheme{

  static getFont(){
    return const TextTheme(
      titleSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, height: 1.2),
      titleMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, height: 1.2),
      titleLarge: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, height: 1.2),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, height: 1.2),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, height: 1.3),
      displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, height: 1.3),
      displayMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, height: 1.4),
      displayLarge: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600, height: 1.4),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, height: 1.2),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, height: 1.2),
      labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400, height: 1.2),
      bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, height: 1.2),
    );
  }

  static ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: Colors.pinkAccent,
      highlightColor: Colors.deepPurpleAccent,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.pinkAccent),
      brightness: Brightness.light,
      hintColor: Colors.black54,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black54),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: getFont(),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: Colors.deepPurpleAccent,
      highlightColor: Colors.pinkAccent,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.deepPurpleAccent),
      brightness: Brightness.light,
      hintColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.deepPurpleAccent.shade100,
      textTheme: getFont(),
    );
  }


  static ThemeMode getThemeMode({Color customColor = Colors.white}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: customColor),
    );
    return ThemeMode.light;
    // switch (_themeMode) {
    //   case 'ThemeMode.light':
    //     SystemChrome.setSystemUIOverlayStyle(
    //       SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: ColorsUtilities.white_color),
    //     );
    //     return ThemeMode.light;
    //   case 'ThemeMode.dark':
    //     SystemChrome.setSystemUIOverlayStyle(
    //       SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
    //     );
    //     return ThemeMode.dark;
    //   case 'ThemeMode.system':
    //     return ThemeMode.system;
    //   default:
    //     if (setting.value.defaultTheme == "dark") {
    //       SystemChrome.setSystemUIOverlayStyle(
    //         SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
    //       );
    //       return ThemeMode.dark;
    //     } else {
    //       SystemChrome.setSystemUIOverlayStyle(
    //         SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: ColorsUtilities.white_color),
    //       );
    //       return ThemeMode.light;
    //     }
    // }
  }
}