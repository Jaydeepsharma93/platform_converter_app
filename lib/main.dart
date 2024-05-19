import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/android%20screens/androidscreen.dart';
import 'package:platform_converter_app/screens/android%20screens/view/provider/provider.dart';
import 'package:platform_converter_app/screens/ios%20screens/ios.dart';
import 'package:platform_converter_app/screens/provider/Systemchangeprovider.dart';
import 'package:platform_converter_app/screens/provider/changetheme.dart';
import 'package:platform_converter_app/screens/provider/imgpickerprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SystemChange(),
      ),
      ChangeNotifierProvider(
        create: (context) => ImagePickerProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddData(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeChange(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeChange>(context).isLight
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Provider.of<SystemChange>(context).isIos
          ? IosScreen()
          : AndroidScreen(),
    );
  }
}
