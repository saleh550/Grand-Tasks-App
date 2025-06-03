// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
class ThirdScreen extends StatefulWidget  {
  @override
_Task3ScreenState createState()=>_Task3ScreenState();
}
class _Task3ScreenState extends State<ThirdScreen> {
  List<int> numbers = [];
  int currentNumber = 0;
  bool isProcessing = false;
  bool isEvenTurn = true;
  Completer<void>? evenCompleter;
  Completer<void>? oddCompleter;
  // Even numbers
  Future<void> generateEvenNumbers() async {
    for (int i = 0; i < 100; i += 2) {
      await evenCompleter!.future;
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        currentNumber=i;
      });
      evenCompleter = Completer<void>(); // reset
      oddCompleter!.complete(); // signal odd thread
    }
  }

  // Odd numbers
  Future<void> generateOddNumbers() async {
    for (int i = 1; i < 100; i += 2) {
      await oddCompleter!.future;

      await Future.delayed(Duration(milliseconds: 500)); // simulate work
      setState(() {
        currentNumber=i;
      });
      isEvenTurn = true;

      oddCompleter = Completer<void>(); // reset
      evenCompleter!.complete(); // signal even thread
    }
  }

  void startProcess() async {
    if (isProcessing) return;

    setState(() {
      currentNumber = 0;
      isProcessing = true;
    });

    // Initialize completers
    evenCompleter = Completer<void>();
    oddCompleter = Completer<void>();

    // Start with even
    evenCompleter?.complete();
    await Future.wait([
      generateEvenNumbers(),
      generateOddNumbers(),
    ]);

    setState(() {
      isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: startProcess,
            child: Text('Start Process'),
          ),
          SizedBox(height: 24),
          Text(
            '$currentNumber',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

}