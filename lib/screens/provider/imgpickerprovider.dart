import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier{
  ImagePicker picker = ImagePicker();
  File? imagepath;

  Future<void> pickimg() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    imagepath = File(images!.path);
    notifyListeners();
  }
}
