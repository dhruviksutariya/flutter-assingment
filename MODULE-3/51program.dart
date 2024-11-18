import 'package:flutter/material.dart';

void main() {
  runApp(Program51());
}

class Program51 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Range',
      home: InputNumbersScreen(),
    );
  }
}

class InputNumbersScreen extends StatefulWidget {
  @override
  _InputNumbersScreenState createState() => _InputNumbersScreenState();
}

class _InputNumbersScreenState extends State<InputNumbersScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();

  void navigateToDisplayScreen() {
    int? num1 = int.tryParse(number1Controller.text);
    int? num2 = int.tryParse(number2Controller.text);

    // Check for valid input
    if (num1 == null || num2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid integers!")),
      );
      return;
    }

    // Navigate to the next screen with num1 and num2
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayNumbersScreen(num1: num1, num2: num2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Numbers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
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
            ElevatedButton(
              onPressed: navigateToDisplayScreen,
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayNumbersScreen extends StatelessWidget {
  final int num1;
  final int num2;

  DisplayNumbersScreen({required this.num1, required this.num2});

  List<int> getNumbersInRange() {
    List<int> numbers = [];
    int start = num1 < num2 ? num1 : num2;
    int end = num1 > num2 ? num1 : num2;

    for (int i = start; i <= end; i++) {
      numbers.add(i);
    }
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    List<int> numbersInRange = getNumbersInRange();

    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers in Range'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: numbersInRange.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(numbersInRange[index].toString()),
            );
          },
        ),
      ),
    );
  }
}