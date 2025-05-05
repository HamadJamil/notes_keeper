import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _darkTheme = false;

  bool isDarkTheme() => _darkTheme;

  void updateTheme({required bool value}){
    _darkTheme = value;
    notifyListeners();
  }

}