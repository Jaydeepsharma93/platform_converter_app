import 'package:flutter/material.dart';
import 'package:platform_converter_app/screens/ios%20screens/ios.dart';
import 'package:platform_converter_app/screens/provider/Systemchangeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SystemChange(),
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
      debugShowCheckedModeBanner: false,
      home: IosScreen(),
    );
  }
}
