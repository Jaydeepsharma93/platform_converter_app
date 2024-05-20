import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/ios%20screens/view/provider/provider.dart';
import 'package:platform_converter_app/screens/provider/changetheme.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imagepath = Provider.of<ImgProvider>(context).imagepath;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text('Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle:
                  Text('Update Profile Data', style: TextStyle(fontSize: 16)),
              trailing: Switch(
                value: Provider.of<ThemeChange>(context).isContainer,
                onChanged: (value) {
                  Provider.of<ThemeChange>(context, listen: false)
                      .container(value);
                },
              ),
            ),
            (Provider.of<ThemeChange>(context).isContainer)
                ? Container(
                    height: 280,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Provider.of<ImgProvider>(context, listen: false)
                                  .pickimg();
                            },
                            child: CircleAvatar(
                              child: imagepath == null
                                  ? Icon(Icons.add_a_photo_outlined)
                                  : null,
                              backgroundImage:
                              imagepath == null ? null : FileImage(imagepath),
                              maxRadius: 65,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {}, child: Text("SAVE")),
                            TextButton(onPressed: () {}, child: Text("CLEAR"))
                          ],
                        )
                      ],
                    ),
                  )
                : Container(),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.wb_sunny_outlined,
                size: 35,
              ),
              title: Text('Theme',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle: Text("Change Theme", style: TextStyle(fontSize: 16)),
              trailing: Switch(
                value: Provider.of<ThemeChange>(context).isLight,
                onChanged: (value) {
                  Provider.of<ThemeChange>(context, listen: false)
                      .changeTheme(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
