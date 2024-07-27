import 'package:flutter/material.dart';

void main() {
  runApp(Program55());
}

class Program55 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckboxTextView(),
    );
  }
}

class CheckboxTextView extends StatefulWidget {
  @override
  _CheckboxTextViewState createState() => _CheckboxTextViewState();
}

class _CheckboxTextViewState extends State<CheckboxTextView> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Text View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(height: 20),
            isChecked
                ? Text(
              'TextView is Visible',
              style: TextStyle(fontSize: 20),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
