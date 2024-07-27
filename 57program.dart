import 'package:flutter/material.dart';

void main() => runApp(Program57());

class Program57 extends StatefulWidget {
  @override
  State<Program57> createState() => _Program57State();
}

class _Program57State extends State<Program57> {
  var quenGroup = -1;
  Color _selectedColor = Colors.white;

  void _optionChanged(int? value) {
    setState(() {
      quenGroup = value!;
      _selectedColor = _getSelectedColor(value);
    });
  }

  Color _getSelectedColor(int value) {
    late Color color;

    switch (value) {
      case 1:
        color = Colors.red;
        break;
      case 2:
        color = Colors.green;
        break;
      case 3:
        color = Colors.blue;
        break;
      case 4:
        color = Colors.amber;
        break;
      default:
        color = Colors.white;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Widget',
      home: Scaffold(
        backgroundColor: _selectedColor,
        body: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please select your color ?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: quenGroup,
                        onChanged: (value) {
                          _optionChanged(value);
                        },
                      ),
                      Text('Red'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: quenGroup,
                        onChanged: (value) {
                          _optionChanged(value);
                        },
                      ),
                      Text('Green'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: quenGroup,
                        onChanged: (value) {
                          _optionChanged(value);
                        },
                      ),
                      Text('Blue'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: quenGroup,
                        onChanged: (value) {
                          _optionChanged(value);
                        },
                      ),
                      Text('Amber'),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
