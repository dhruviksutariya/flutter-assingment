import 'package:flutter/material.dart';

void main() { runApp(Program53());
}

class Program53 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chang Background Color',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.pink,
  ];

  int _currentColorIndex = 0;

  void _changeColor() {
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solid Color Background Changer'),
      ),
      body: Container(
        color: _colors[_currentColorIndex],
        child: Center(
          child: ElevatedButton(
            onPressed: _changeColor,
            child: Text('Change Background Color'),
          ),
        ),
      ),
    );
  }
}