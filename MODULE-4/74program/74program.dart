import 'package:flutter/material.dart';

import '../75program/75program.dart';

void main() => runApp(Program74());

class Program74 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Program75(),
                    ));
              },
              child: Text('Click to Redirect'),
            )
          ],
        ),
      ),
    )
    );
  }
}
