import 'package:flutter/material.dart';
import 'package:cybersafe/themes/dark_theme.dart';
import 'package:cybersafe/themes/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkTheme) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
  }
}
