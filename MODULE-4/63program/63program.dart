import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(Program63());

class Program63 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AlertTost()
    );
  }
}
class AlertTost extends StatefulWidget {
  const AlertTost({super.key});

  @override
  State<AlertTost> createState() => _AlertTostState();
}

class _AlertTostState extends State<AlertTost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(onPressed: () => showDialog(context: context,builder: (context) => AlertDialog(
             title: Text('Select Button'),
             actions: [
               Column(
                 children: [
                   TextButton(onPressed: (){
                     Fluttertoast.showToast(
                         msg: "Positive",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.black,
                         textColor: Colors.white,
                         fontSize: 16.0,
                     );
                     Navigator.pop(context);
                   }, child: Text('Positive',style: TextStyle(fontSize: 20),),),
                   SizedBox(height: 20,),
                   TextButton(onPressed: (){
                     Fluttertoast.showToast(
                         msg: "Negative",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.black,
                         textColor: Colors.white,
                         fontSize: 16.0
                     );
                     Navigator.pop(context);

                   }, child: Text('Negative',style: TextStyle(fontSize: 20)),),
                   SizedBox(height: 20,),
                   TextButton(onPressed: (){
                     Fluttertoast.showToast(
                         msg: "Neutral",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.black,
                         textColor: Colors.white,
                         fontSize: 16.0
                     );
                     Navigator.pop(context);

                   }, child: Text('Neutral',style: TextStyle(fontSize: 20)),),

                 ],
               )
             ],
           ),), child: Text('Clik'))
          ],
        )
      ),
    );
  }
}

