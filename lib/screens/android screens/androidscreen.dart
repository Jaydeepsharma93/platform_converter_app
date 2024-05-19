import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/view/addscreen.dart';
import 'package:platform_converter_app/screens/android%20screens/view/chatscreen.dart';
import 'package:platform_converter_app/screens/android%20screens/view/settingscreen.dart';
import 'package:platform_converter_app/screens/provider/Systemchangeprovider.dart';
import 'package:provider/provider.dart';

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Platform Converter"),
          actions: [
            Switch(
              value: Provider
                  .of<SystemChange>(context)
                  .isIos,
              onChanged: (value) {
                Provider.of<SystemChange>(context, listen: false)
                    .changeSystem(value);
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person_add_alt),),
              Tab(child: Text('CHATS'),),
              Tab(child: Text('CALLS'),),
              Tab(child: Text('SETTINGS'),)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddScreen(),
            ChatScreen(),
            Center(child: Text('No Any Chat Yet...')),
            SettingScreen()
          ],
        ),
      ),
    );
  }
}
