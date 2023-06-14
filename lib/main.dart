import 'package:flutter/material.dart';
import 'package:movies/screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey[900], // Shade of grey for scaffold background
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white), // White text color
            bodyText2: TextStyle(color: Colors.white), // White text color
          ),
        ),
      home:  HomeScreen()
    );
  }
}
