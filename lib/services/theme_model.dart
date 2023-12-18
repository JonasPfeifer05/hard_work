import 'package:flutter/cupertino.dart';

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = true;
  Color? fontColor;
  Color? backgroundOne;
  Color? backgroundTwo;
  Color? backgroundThree;
  Color? highlight;

  ThemeModel.darkMode() {
    setToDarkMode();
    notifyListeners();
  }

  ThemeModel.lightMode() {
    setToLightMode();
    notifyListeners();
  }

  void setToDarkMode() {
    fontColor = const Color.fromARGB(255, 255, 255, 255);
    backgroundOne = const Color.fromARGB(255, 33, 33, 33);
    backgroundTwo = const Color.fromARGB(255, 50, 50, 50);
    backgroundThree = const Color.fromARGB(255, 84, 84, 84);
    highlight = const Color.fromARGB(255, 13, 115, 119);
    _isDarkMode = true;
  }

  void setToLightMode() {
    _isDarkMode = false;
  }

  bool isDarkMode() {
    return _isDarkMode;
  }
}
