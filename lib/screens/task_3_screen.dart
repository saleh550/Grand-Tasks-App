// screens/home_screen.dart
import 'package:flutter/material.dart';

class Task3Screen extends StatefulWidget  {
  @override
_Task3ScreenState createState()=>_Task3ScreenState();
}
class _Task3ScreenState extends State<Task3Screen> {
  List<int> numbers = [];
  bool isProcessing = false;

  // Even numbers
  Future<void> generateEvenNumbers() async {
    for (int i = 0; i < 100; i += 2) {
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        numbers.add(i);
      });
    }
  }

  // Odd numbers
  Future<void> generateOddNumbers() async {
    for (int i = 1; i < 100; i += 2) {
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        numbers.add(i);
      });
    }
  }

  void startProcess() async {
    if (isProcessing) return;

    setState(() {
      numbers.clear();
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
    return Column(
      children: [
        ElevatedButton(
          onPressed: startProcess,
          child: Text('Start Process'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(numbers[index].toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}