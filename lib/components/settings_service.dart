import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  static const String _themeKey = 'themeMode';

  /// Loads the User's preferred ThemeMode from local or remote storage.
  ///
  // Future<ThemeMode> themeMode() async => ThemeMode.system;
  Future<ThemeMode> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeMode = prefs.getString(_themeKey);
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (themeMode) {
      case ThemeMode.light:
        prefs.setString(_themeKey, 'light');
        break;
      case ThemeMode.dark:
        prefs.setString(_themeKey, 'dark');
        break;
      case ThemeMode.system:
        prefs.setString(_themeKey, 'system');
        break;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  ///
  //Future<void> updateThemeMode(ThemeMode theme) async {
  // Use the shared_preferences package to persist settings locally or the
  // http package to persist settings over the network.
  // }
}
