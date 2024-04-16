import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppTheme {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  bool isSavedDarkMode() {
    return _storage.read(_key) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void saveThemeMode(bool isDarkMode) {
    _storage.write(_key, !isDarkMode);
  }
}
