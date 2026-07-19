import 'package:flutter/material.dart';
import '../core/theme/theme_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    bool isDark = await ThemeHelper.getTheme();

    _themeMode =
    isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      await ThemeHelper.saveTheme(true);
    } else {
      _themeMode = ThemeMode.light;
      await ThemeHelper.saveTheme(false);
    }

    notifyListeners();
  }
}