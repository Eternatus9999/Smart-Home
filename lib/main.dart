import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_project/pages/Homepage.dart';
import 'package:iot_project/pages/Menu.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SmartHome(),
    );
  }
}

class SmartHome extends StatefulWidget {
  const SmartHome({super.key});

  @override
  // State createState() => Homepage("Chathusha", [["Lights", "lib/icons/lamp.png", false, 200], ["Fans", "lib/icons/fan.png", false, 200], ["A/C", "lib/icons/air-conditioner.png", false, 200], ["TV", "lib/icons/monitor.png", false, 200]]);
  State createState() => Menu();
}


