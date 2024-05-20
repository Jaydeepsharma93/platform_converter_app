import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/view/addscreen.dart';
import 'package:platform_converter_app/screens/model/listofperson.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

class AddData extends ChangeNotifier {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  Duration? duration;

  void pickDate(DateTime? dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void pickTime({TimeOfDay? timeOfDay, Duration? duration}) {
    this.duration = duration;
    this.timeOfDay = timeOfDay;

    if (duration != null) {
      final int hours = duration.inHours % 24;
      final int minutes = duration.inMinutes % 60;
      this.timeOfDay = TimeOfDay(hour: hours, minute: minutes);
    }
    notifyListeners();
  }

  void addData(context) {
    listOfPerson.add({
      'Name': txtName.text,
      'Chat': txtChat.text,
      'Num': int.parse(txtNumder.text),
      'img': FileImage(Provider.of<ImagePickerProvider>(context).imagepath!)
    });
    notifyListeners();
  }
}
