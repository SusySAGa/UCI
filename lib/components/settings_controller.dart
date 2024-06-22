import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
        brightness: Brightness.dark,
      );

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.getThemeMode();
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    _settingsService.setThemeMode(themeMode);
    notifyListeners();
  }
}
