import 'package:flutter/material.dart';

void main() => runApp(Program58());

class Program58 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Seekbar()
    );
  }
}

class Seekbar extends StatefulWidget {

  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  double rValue = 0,
      gValue = 0,
      bValue = 0;

  Color? _color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color ?? Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('R')),
                    Expanded(
                      child: Slider(
                        value: rValue,
                        min: 0,
                        max: 255,
                        onChanged: (value) {
                          rValue = value;
                          changeBackground();
                        },
                      ),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('${rValue.round().toInt()}')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('G')),
                    Expanded(
                      child: Slider(
                        value: gValue,
                        min: 0,
                        max: 255,
                        onChanged: (value) {
                          gValue = value;
                          changeBackground();
                        },
                      ),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('${gValue.round().toInt()}')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('B')),
                    Expanded(
                      child: Slider(
                        value: bValue,
                        min: 0,
                        max: 255,
                        onChanged: (value) {
                          bValue = value;
                          changeBackground();
                        },
                      ),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 17,
                        child: Text('${bValue.round().toInt()}')),
                  ],
                )
              ],
            )),
      ),
    );
  }

  void changeBackground() {
    setState(() {
      _color =
          Color.fromARGB(255, rValue.round(), gValue.round(), bValue.round());
    });
  }
}