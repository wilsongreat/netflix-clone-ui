import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone_app/screens/screens.dart';
import 'package:flutter_netflix_clone_app/widgets/nav_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black),
      home: const NavScreen(),
    );
  }
}
