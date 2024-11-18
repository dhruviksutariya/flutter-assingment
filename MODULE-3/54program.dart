import 'package:flutter/material.dart';

void main() {
  runApp(Program54());
}

class Program54 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FontSizeChanger(),
    );
  }
}

class FontSizeChanger extends StatefulWidget {
  @override
  _FontSizeChangerState createState() => _FontSizeChangerState();
}

class _FontSizeChangerState extends State<FontSizeChanger> {
  double _fontSize = 20.0;

  void increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  void decreaseFontSize() {
    setState(() {
      _fontSize -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Incriment and Dicriment'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  increaseFontSize();
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20,),
              Text(
                'Sample Text',
                style: TextStyle(fontSize: _fontSize),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  decreaseFontSize();
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
