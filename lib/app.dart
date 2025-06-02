import 'package:flutter/material.dart';
import 'main_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grand Tasks App',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}