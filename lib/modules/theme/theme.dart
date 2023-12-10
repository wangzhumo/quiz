import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/modules/resources/colors.dart';
import 'package:quiz/modules/store/shared_provider.dart';

// THEME PROVIDERS
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

// THEMES
final _theme = ThemeData.light().copyWith(
    platform: TargetPlatform.iOS,
    primaryColor: Colors.white,
    canvasColor: Colors.transparent,
    highlightColor: Colors.blue[200],
    primaryIconTheme: const IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: Colors.blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        headlineLarge: TextStyle(
          fontSize: 21,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: Colors.black,
        )));

final _customTheme = CustomThemeData(
  backgroundColor: QColors.grey200,
  btColor: Colors.white,
  textColor: Colors.black,
  hintTextColor: Colors.black38,
);

final _darkTheme = ThemeData.dark().copyWith(
    platform: TargetPlatform.iOS,
    highlightColor: Colors.blue[200],
    canvasColor: Colors.transparent,
    primaryColor: const Color(0xff323639),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.blue),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          fontSize: 21,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: Colors.white,
        )));

final _customDarkTheme = CustomThemeData(
  backgroundColor: QColors.grey800,
  btColor: Colors.black,
  textColor: Colors.white,
  hintTextColor: Colors.white30,
);

// EXTENSIONS AND CLASSES
extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;
}

class CustomThemeData {
  final Color backgroundColor;
  final Color btColor;
  final Color textColor;
  final Color hintTextColor;
  CustomThemeData(
      {this.backgroundColor = Colors.white,
      this.btColor = Colors.white,
      this.textColor = Colors.white,
      this.hintTextColor = Colors.white});
}

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);

  SystemUiOverlayStyle systemUiOverlay() {
    if (state == ThemeMode.dark) {
      return SystemUiOverlayStyle.light;
    }
    return SystemUiOverlayStyle.dark;
  }

  void toggle() {
    if (state == ThemeMode.dark) {
      preferences.persistThemeMode(ThemeMode.light);
      state = ThemeMode.light;
    } else {
      preferences.persistThemeMode(ThemeMode.dark);
      state = ThemeMode.dark;
    }
  }
}
