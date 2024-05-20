import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screens/ios%20screens/view/iosaddscreen.dart';
import 'package:platform_converter_app/screens/ios%20screens/view/settingios.dart';
import 'package:platform_converter_app/screens/provider/Systemchangeprovider.dart';
import 'package:platform_converter_app/screens/provider/changetheme.dart';
import 'package:provider/provider.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Provider.of<ThemeChange>(context).isLight?Brightness.dark:Brightness.light
      ),
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Platform Converter"),
            trailing: CupertinoSwitch(
              value: Provider.of<SystemChange>(context).isIos,
              onChanged: (value) {
                Provider.of<SystemChange>(context,listen: false).changeSystem(value);
              },
            ),
          ),
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
              ],
            ),
            tabBuilder: (context, index) {
              return list[index];
            },
          ),
      ),
    );
  }
}

List list = [
  IosAddDetail(),
  Container(),
  Container(),
  SettingScreenIos()
];
