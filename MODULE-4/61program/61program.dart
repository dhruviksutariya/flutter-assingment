import 'package:flutter/material.dart';

void main() {
  runApp(Program61());
}

class Program61 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Expanded(child: SpinnerDropdown()),
              SizedBox(width: 10),
              SearchField(),
            ],
          ),
          body: Center(child: Text('Content goes here')),
        ),
      ),
    );
  }
}

class SpinnerDropdown extends StatefulWidget {
  @override
  _SpinnerDropdownState createState() => _SpinnerDropdownState();
}

class _SpinnerDropdownState extends State<SpinnerDropdown> {
  String? selectedValue;
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      hint: Text('Select'),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}