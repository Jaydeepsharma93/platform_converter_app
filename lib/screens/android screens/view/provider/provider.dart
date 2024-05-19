import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/view/addscreen.dart';
import 'package:platform_converter_app/screens/model/listofperson.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

class AddData extends ChangeNotifier {
  void addData(context) {
    int num = int.parse(txtNumder.text);
    notifyListeners();
    listOfPerson.add({
      'Name': txtName.text,
      'Chat': txtChat.text,
      'Num': num,
      // 'img': FileImage(Provider.of<ImagePickerProvider>(context,listen: true).imagepath!)
    });
    notifyListeners();
  }
}
