import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/task_2_screen.dart';
import 'screens/task_3_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Grand Tasks App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Task 2'),
              Tab(text: 'Task 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            Task2Screen(),
            Task3Screen(),
          ],
        ),
      ),
    );
  }
}
