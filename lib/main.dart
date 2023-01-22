import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoga_app/screens/first_screen.dart';
import 'package:yoga_app/starting_interfaces/first_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Yoga_App(),
    );
  }
}
class Yoga_App extends StatefulWidget {
  const Yoga_App({Key? key}) : super(key: key);

  @override
  State<Yoga_App> createState() => _Yoga_AppState();
}

class _Yoga_AppState extends State<Yoga_App> {
  @override
  Widget build(BuildContext context) {
    return FirstInterface();
  }
}

