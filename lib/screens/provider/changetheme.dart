import 'package:flutter/cupertino.dart';

class ThemeChange extends ChangeNotifier {
  bool isLight = false;

  void changeTheme(value) {
    isLight = value;
    notifyListeners();
  }
}
