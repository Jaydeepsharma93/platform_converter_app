import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screens/provider/Systemchangeprovider.dart';
import 'package:provider/provider.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
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
            return Container();
          },
        ),
      ),
    );
  }
}

List list = [];
