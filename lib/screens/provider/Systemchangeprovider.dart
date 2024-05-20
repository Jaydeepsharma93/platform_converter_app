import 'package:flutter/cupertino.dart';

class SystemChange extends ChangeNotifier {
  bool isIos = true;

  void changeSystem(value) {
    isIos = value;
    notifyListeners();
  }
}
