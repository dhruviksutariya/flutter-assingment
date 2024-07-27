import 'package:flutter/material.dart';

import '59program.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singscreen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),labelText: 'First name'),),
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),labelText: 'Last name'),),
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),labelText: 'Email name'),),
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),labelText: 'cintect number'),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context) => Program59(),));
              }, child: Text('SUBMIT',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
