import 'package:flutter/material.dart';

class Seconddesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.red,
                ),
                SizedBox(height: 10,),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Container(
                      color: Colors.blue,
                      height: 180,
                      width: 180,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 180,
                      width: 180,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 180,
                      width: 180,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 180,
                      width: 180,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 120,
                      width: 120,
                    )
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}