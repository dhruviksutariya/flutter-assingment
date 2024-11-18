import 'package:flutter/material.dart';

void main() => runApp(Program62());

class Program62 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: DialogBox());
  }
}

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Profile Ifomation Error'),
                        content: Text('your profile is not a filde in form'),
                        icon: Icon(Icons.error),
                        actions: [
                          FilledButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('ok'))
                        ],
                      ),
                    ),
                child: Text('showDialog')),
          ],
        )),
      ),
    );
  }
}
