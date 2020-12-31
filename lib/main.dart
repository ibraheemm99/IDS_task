import 'package:flutter/material.dart';
import 'package:ids_task/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IDS Task',
      theme: ThemeData(primaryColor: Colors.pink),
      home: HomeScreen() ,
    );
  }
}