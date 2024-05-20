import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/view/addscreen.dart';
import 'package:platform_converter_app/screens/android%20screens/view/settingscreen.dart';
import 'package:platform_converter_app/screens/ios%20screens/view/provider/provider.dart';
import 'package:platform_converter_app/screens/provider/changetheme.dart';
import 'package:provider/provider.dart';

class SettingScreenIos extends StatelessWidget {
  const SettingScreenIos({super.key});

  @override
  Widget build(BuildContext context) {
    var imagepath = Provider.of<ImgProvider>(context).imagepath;
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CupertinoListTile(
              leading: Icon(
                CupertinoIcons.person,
                size: 32,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Update Profile Data",
                style: TextStyle(fontSize: 15),
              ),
              trailing: CupertinoSwitch(
                value: Provider.of<ThemeChange>(context).isContainer,
                onChanged: (value) {
                  Provider.of<ThemeChange>(context, listen: false)
                      .container(value);
                },
              ),
            ),
            (Provider.of<ThemeChange>(context).isContainer)
                ? Container(
                    height: 320,
                    child: Column(
                      children: [
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
                            Provider.of<ImgProvider>(context, listen: false)
                                .pickimg();
                          },
                        ),
                        CupertinoTextField(
                          controller: txtnamea,
                          placeholder: 'Enter Your Name...',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CupertinoTextField(
                            controller: txtbio,
                            placeholder: 'Enter Your Bio...',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                child: Text('SAVE'), onPressed: () {}),
                            CupertinoButton(
                                child: Text('CLEAR'), onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  )
                : Container(),
            Divider(),
            CupertinoListTile(
              leading: Icon(
                CupertinoIcons.sun_max,
                size: 32,
              ),
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Change Theme",
                style: TextStyle(fontSize: 15),
              ),
              trailing: CupertinoSwitch(
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
    ));
  }
}
