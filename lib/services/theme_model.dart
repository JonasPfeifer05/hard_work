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
    fontColor = const Color.fromARGB(255, 255, 255, 255);
    backgroundOne = const Color.fromARGB(255, 233, 233, 233);
    backgroundTwo = const Color.fromARGB(255, 181, 181, 181);
    backgroundThree = const Color.fromARGB(255, 120, 120, 120);
    highlight = const Color.fromARGB(255, 20, 178, 184);
    _isDarkMode = false;
  }

  void switchTheme() {
    if (_isDarkMode) {
      setToLightMode();
    } else {
      setToDarkMode();
    }
    notifyListeners();
  }
}
