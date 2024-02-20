import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = lightTheme();
  ThemeData get theme => _theme;

  toggleTheme() {
    _theme = _theme.brightness == Brightness.light ? darkTheme() : lightTheme();
    notifyListeners();
  }

  bool isInLightMode() {
    return (_theme.brightness == Brightness.light);
  }
}

ThemeData darkTheme() {
  return ThemeData(brightness: Brightness.dark, colorSchemeSeed: Colors.amber);
}

ThemeData lightTheme() {
  return ThemeData(brightness: Brightness.light, colorSchemeSeed: Colors.purple);
}
