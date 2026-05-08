
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
    String appLocale = 'en';
  updatetheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

    updateLanguage() {
    if (appLocale == 'ar') {
      appLocale = 'en';
    } else {
      appLocale = 'ar';
    }
    notifyListeners();
  }
}
