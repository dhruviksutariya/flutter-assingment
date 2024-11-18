import 'package:flutter/material.dart';

void main() => runApp(Program56());

class Program56 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('image/1.jpg',height: 100,width: 100,),
                  Image.asset('image/2.jpg',height: 100,width: 100,)
            ]
    ),
       Text('TEXT VIEW',style: TextStyle(fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('image/3.jpg',height: 100,width: 100,),
                Image.asset('image/4.jpg',height: 100,width: 100,)
              ],
            )
          ],
        )
        ),
    );
  }
}
