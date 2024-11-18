import 'package:flutter/material.dart';

import '69program.dart';
import 'GmailApp.dart';
class GmailAppSplash extends StatefulWidget {

  @override
  State<GmailAppSplash> createState() => _GmailAppSplashState();
}

class _GmailAppSplashState extends State<GmailAppSplash> {
  @override
  Widget build(BuildContext context) {
    exitSplash();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 270,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/Gmail.jpg')),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> exitSplash() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GmailApp(),
        ));
  }
}
