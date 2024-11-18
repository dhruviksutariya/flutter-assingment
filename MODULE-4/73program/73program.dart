import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(Program73());

class Program73 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program73',
      home: SplaseScreen(),
    );
  }
}

class SplaseScreen extends StatefulWidget {
  @override
  State<SplaseScreen> createState() => _SplaseScreenState();
}

class _SplaseScreenState extends State<SplaseScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => blanckpage(),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('image/user.png',),height: 100,width: 100,)
            ],
          ),
        )
    );
  }
}

class blanckpage extends StatelessWidget {
  const blanckpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Wecome to first page')),
    );
  }
}




