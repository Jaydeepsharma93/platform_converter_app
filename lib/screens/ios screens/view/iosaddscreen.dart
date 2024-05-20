import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screens/android%20screens/view/provider/provider.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

TextEditingController txtName1 = TextEditingController();
TextEditingController txtNumder1 = TextEditingController();
TextEditingController txtChat1 = TextEditingController();

class IosAddDetail extends StatelessWidget {
  const IosAddDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var imagepath = Provider.of<ImagePickerIos>(context).imagepath;
    return CupertinoPageScaffold(
        child: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CupertinoButton(
                  child: ClipOval(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          image: imagepath == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(imagepath))),
                      child: imagepath == null
                          ? Icon(CupertinoIcons.camera,
                              color: CupertinoColors.white)
                          : null,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<ImagePickerIos>(context, listen: false).pickimg();
                  },
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.person,
                      size: 35,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all()),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        child: CupertinoTextFormFieldRow(
                          placeholder: 'Full Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required field";
                            } else {
                              return null;
                            }
                          },
                          controller: txtName1,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      size: 35,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all()),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        child: CupertinoTextFormFieldRow(
                          placeholder: 'Phone Number',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required field";
                            } else {
                              return null;
                            }
                          },
                          controller: txtNumder1,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_text,
                      size: 35,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all()),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        child: CupertinoTextFormFieldRow(
                          placeholder: 'Chat Conversation',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required field";
                            } else {
                              return null;
                            }
                          },
                          controller: txtChat1,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CupertinoButton(
                      child: Icon(
                        CupertinoIcons.calendar,
                        size: 35,
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => Container(
                                  height: 200,
                                  color: CupertinoColors.white,
                                  child: CupertinoDatePicker(
                                    onDateTimeChanged: (value) {
                                      Provider.of<AddData>(context, listen: false)
                                          .pickDate(value);
                                    },
                                  ),
                                ));
                      },
                    ),
                    Text(
                      Provider.of<AddData>(context).dateTime == null
                          ? "Pick Date"
                          : "${Provider.of<AddData>(context).dateTime!.day.toString() + '-' + Provider.of<AddData>(context).dateTime!.month.toString() + '-' + Provider.of<AddData>(context).dateTime!.year.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CupertinoButton(
                      child: Icon(
                        CupertinoIcons.clock,
                        size: 35,
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => Container(
                                height: 200,
                                color: CupertinoColors.white,
                                child: CupertinoTimerPicker(
                                  onTimerDurationChanged: (value) {
                                    Provider.of<AddData>(context,listen: false)
                                        .pickTime(duration: value);
                                  },
                                )));
                      },
                    ),
                    Text(
                      Provider.of<AddData>(context).timeOfDay == null
                          ? "Pick Time"
                          : "${Provider.of<AddData>(context).timeOfDay!.hour.toString() + ":" + Provider.of<AddData>(context).timeOfDay!.minute.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}