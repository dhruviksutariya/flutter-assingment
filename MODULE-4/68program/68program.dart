import 'package:flutter/material.dart';

void main() => runApp(Program68());

class Program68 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                  // profile // navigate to ProfileScreen
                    print('Edit option selected');
                    break;
                  case 1:
                    print('View option selected');
                    break;
                  case 2:
                    print('Delete option selected');
                    // profile // navigate to ProfileScreen
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('View'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Delete'),
                  value: 2,
                ),
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

