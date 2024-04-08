import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Presentation/View/Screens/HomePage.dart';

import 'Presentation/View/Screens/Splash.dart';

void main() {
  runApp(
      DevicePreview(
    enabled: true,
    tools: [
      ...DevicePreview.defaultTools,
    ], builder: (BuildContext context) {return const MyApp();  },
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Splash(),
      
    );
  }
}











