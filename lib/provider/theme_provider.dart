import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  final SharedPreferencesAsync _pref = SharedPreferencesAsync();
  
  bool _darkTheme = false;
  bool _newUser = true;

  bool isDarkTheme() => _darkTheme;
  bool getNewUser() => _newUser;

  void updateTheme({required bool value})  {
    _darkTheme = value;
    saveTheme(value: value);
    notifyListeners();
  }

  void saveTheme({required bool value}) async {
    _pref.setBool('darkTheme', value);
  }

  void loadTheme() async {
    _darkTheme = await _pref.getBool('darkTheme') ?? false;
    notifyListeners();
  }

  void updateNewUser() {
    _newUser = false;
    _pref.setBool('NewUser', false);
  }
  
  void isNewUser() async {
    _newUser = await _pref.getBool('NewUser') ?? true;
    notifyListeners();
  }

}
