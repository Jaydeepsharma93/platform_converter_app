import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/model/listofperson.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:List.generate(listOfPerson.length, (index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(Provider.of<ImagePickerProvider>(context).imagepath!),
          ),
          title: Text('Jaydeep'),
          subtitle: Text('hello'),
          trailing: Text('22'),
        ))
      )
    );
  }
}
