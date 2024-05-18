import 'package:flutter/cupertino.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
       home: CupertinoPageScaffold(
         navigationBar: CupertinoNavigationBar(
           middle: Text("Platform Converter"),
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
  Ios2()
];
class Ios2 extends StatelessWidget {
  const Ios2({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(child: Text(''),));
  }
}
