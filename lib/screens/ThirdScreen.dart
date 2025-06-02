// screens/home_screen.dart
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget  {
  @override
_Task3ScreenState createState()=>_Task3ScreenState();
}
class _Task3ScreenState extends State<ThirdScreen> {
  List<int> numbers = [];
  int currentNumber = 0;
  bool isProcessing = false;
  bool isEvenTurn = true;
  // Even numbers
  Future<void> generateEvenNumbers() async {
    for (int i = 0; i < 100; i += 2) {
      while (!isEvenTurn) {
        await Future.delayed(Duration(milliseconds: 10));
      }
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        currentNumber=i;
      });
      isEvenTurn = false;
    }
  }

  // Odd numbers
  Future<void> generateOddNumbers() async {
    for (int i = 1; i < 100; i += 2) {
      while (isEvenTurn) {
        await Future.delayed(Duration(milliseconds: 10));
      }
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        currentNumber=i;
      });
      isEvenTurn = true;
    }
  }

  void startProcess() async {
    if (isProcessing) return;

    setState(() {
      currentNumber = 0;
      isProcessing = true;
    });


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