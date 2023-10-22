import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/modules/store/shared_provider.dart';

// THEME PROVIDERS
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

// THEMES
final _theme = ThemeData(
  brightness: Brightness.light,
  platform: TargetPlatform.iOS,
  highlightColor: Colors.blue[200],
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light, seedColor: Colors.blue),
  useMaterial3: true,
);

final _customTheme = CustomThemeData(
  imageSize: 150,
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  platform: TargetPlatform.iOS,
  highlightColor: Colors.blue[200],
  colorScheme:
      ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.blue),
  useMaterial3: true,
);

final _customDarkTheme = CustomThemeData();

// EXTENSIONS AND CLASSES
extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;
}

class CustomThemeData {
  final double imageSize;

  CustomThemeData({
    this.imageSize = 100,
  });
}

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);

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
