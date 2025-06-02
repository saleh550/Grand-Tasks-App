// screens/home_screen.dart
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget  {
  @override
  _Task2ScreenState createState() => _Task2ScreenState();
}
class _Task2ScreenState extends State<SecondScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _updateLabel() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter some text',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _updateLabel,
            child: Text('Show in Label'),
          ),
          SizedBox(height: 16),
          Text(
            _displayText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}