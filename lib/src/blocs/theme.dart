import 'package:flutter/material.dart';

bool themebool = false;
Color principalColor = Color(0xff00c7fa);
Color secundarioColor = Color(0xff2a2f3c);

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  //getter
  getTheme() => _themeData;
  //setter
  SetTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
