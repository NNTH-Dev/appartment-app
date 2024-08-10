import 'package:appartmentapp/Screens/Login/login_screen.dart';
import 'package:appartmentapp/Screens/NavigationBar/navigation_bar.dart';
import 'package:appartmentapp/Screens/Report/report_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(),
      home: const LoginScreen(),
    );
  }
}

