import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {


  //true for dark mode//
  //false for light Mode//
  bool _isDarkMode = false;

  bool getThemeMode() {
    return _isDarkMode;
  }

  void changeTheme(bool darkModeOn) {
    _isDarkMode = darkModeOn;
    notifyListeners();
  }
}
