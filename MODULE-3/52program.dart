import 'package:flutter/material.dart';

void main() {
  runApp(Program52());
}

class Program52 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  String operation = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter first number',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter second number',
                  ),
                ),
                SizedBox(height: 20),
                RadioListTile(
                  title: Text('addition'),
                  value: 'add',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Subraction'),
                  value: 'subtract',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Multiptication'),
                  value: 'multiply',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Division'),
                  value: 'divide',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.parse(number1Controller.text);
                    double num2 = double.parse(number2Controller.text);
                    double res = 0;
                    if (operation == 'add') {
                      res = num1 + num2;
                    } else if (operation == 'subtract') {
                      res = num1 - num2;
                    } else if (operation == 'multiply') {
                      res = num1 * num2;
                    } else if (operation == 'divide') {
                      res = num1 / num2;
                    }
                    setState(() {
                      result = 'Result: $res';
                    });
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
