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
    var imagepath = Provider.of<ImagePickerProvider>(context,listen: true).imagepath;
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
                      Provider.of<ImagePickerProvider>(context, listen: false)
                          .pickimg();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CircleAvatar(
                        child: imagepath == null
                            ? Icon(Icons.add_a_photo_outlined)
                            : null,
                        backgroundImage:
                            imagepath == null ? null : FileImage(imagepath),
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
                    IconButton(
                        onPressed: () async {
                          Provider.of<AddData>(context,listen: false).pickDate(
                              await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime(2024)) ??
                                  DateTime.now());
                        },
                        icon: Icon(
                          Icons.date_range,
                          size: 30,
                        )),
                    Text(
                      Provider.of<AddData>(context).dateTime == null
                          ? "Pick Date"
                          : "${Provider.of<AddData>(context, listen: true).dateTime!.day.toString() + '-' + Provider.of<AddData>(context, listen: true).dateTime!.month.toString() + '-' + Provider.of<AddData>(context, listen: true).dateTime!.year.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          Provider.of<AddData>(context, listen: false).pickTime(
                              timeOfDay: await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()) ??
                                  TimeOfDay.now());
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          size: 30,
                        )),
                    Text(
                      Provider.of<AddData>(context).timeOfDay == null
                          ? "Pick Time"
                          : "${Provider.of<AddData>(context).timeOfDay!.hour.toString() + ":" + Provider.of<AddData>(context).timeOfDay!.minute.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                OutlinedButton(
                    onPressed: () {
                      Provider.of<AddData>(context, listen: false)
                          .addData(context);
                      Provider.of<AddData>(context, listen: false)
                          .resetValue(context: context);

                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
