import 'package:flutter/material.dart';
import 'package:untitled/MODULE-3/49program/49-1program.dart';

import '49-2program.dart';


class Program49 extends StatefulWidget {
  @override
  State<Program49> createState() => _Program49State();
}

class _Program49State extends State<Program49> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => fisrdesign(),));
            }, child: Text('firstdesign')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Seconddesign(),));
            }, child: Text('SecondDesign')),
          ],
        )
      ),
    );
  }
}
