import 'package:flutter/material.dart';

void main() {
  runApp(Program50());
}

class Program50 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReverseNumberApp(),
    );
  }
}

class ReverseNumberApp extends StatefulWidget {
  @override
  _ReverseNumberAppState createState() => _ReverseNumberAppState();
}

class _ReverseNumberAppState extends State<ReverseNumberApp> {
  TextEditingController _inputController = TextEditingController();
  TextEditingController _reverseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _inputController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),hintText: 'enter the value'),keyboardType: TextInputType.number,),


              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String input = _inputController.text;
                  try {
                    int number = int.parse(input);
                    int reverse = 0;
                    while (number != 0) {
                      reverse = reverse * 10 + number % 10;
                      number = number ~/ 10;
                    }
                    _reverseController.text = reverse.toString();
                  } catch (FormatException) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter a valid number'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Reverse'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _reverseController,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),hintText: 'revers number')
                ),
            ],
          ),
        ),
      ),
    );
  }
}
