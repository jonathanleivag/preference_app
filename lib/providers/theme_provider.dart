import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  void setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
