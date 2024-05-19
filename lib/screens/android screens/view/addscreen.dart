import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/view/provider/provider.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtNumder = TextEditingController();
TextEditingController txtChat = TextEditingController();
class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Provider.of<ImagePickerProvider>(context,listen: false).pickimg();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CircleAvatar(
                        backgroundImage: Provider.of<ImagePickerProvider>(context).imagepath  != null?FileImage(Provider.of<ImagePickerProvider>(context).imagepath!) : null,
                        maxRadius: 70,
                      ),
                    )),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: txtName,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: txtNumder,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: txtChat,
                    decoration: InputDecoration(
                        labelText: 'Chat Conversation',
                        prefixIcon: Icon(Icons.chat_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {
            
                    }, icon: Icon(Icons.date_range,size: 30,)),
                    Text("Pick Date",style: TextStyle(
                      fontSize: 20,
            
                    ),)
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {
            
                    }, icon: Icon(Icons.watch_later_outlined,size: 30,)),
                    Text("Pick Time",style: TextStyle(
                      fontSize: 20,
            
                    ),)
                  ],
                ),
                OutlinedButton(onPressed: () {
                  Provider.of<AddData>(context,listen: false).addData(context);
                }, child: Text('SAVE',style: TextStyle(
                  fontSize: 20
                ),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}