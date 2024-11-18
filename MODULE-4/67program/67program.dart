import 'package:flutter/material.dart';

void main() => runApp(Program67());

class Program67 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                  // profile // navigate to ProfileScreen
                    print('profile option selected');
                    break;
                  case 1:
                    print('logout option selected');
                    // profile // navigate to ProfileScreen
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Profile'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Logout'),
                  value: 1,
                )
              ],
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
