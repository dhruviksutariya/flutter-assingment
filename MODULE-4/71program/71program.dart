import 'package:flutter/material.dart';
import 'package:flutter_modules/MODULE-4/71program/Screen/Gellary.dart';
import 'package:flutter_modules/MODULE-4/71program/Screen/Music.dart';
import 'package:flutter_modules/MODULE-4/71program/Screen/Video.dart';

void main() {
  runApp(Program71());
}

class Program71 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program71',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Drower(),
    );
  }
}

class Drower extends StatefulWidget {
  const Drower({super.key});

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  int selectedIndex = 0;

  List<Widget> widgetList = [
    Center(
      child: GellaryScreen(),
    ),
    Center(
      child: MusicScreen(),
    ),
    Center(
      child: VideoScreen(),
    ),
  ];

  List<String> titleList = [
    'Gallery Screen',
    'Audio Screen',
    'Video Screen'
  ];

  @override
  itemClicked(int index, BuildContext context) {
    setState(() {
      selectedIndex = index;
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleList[selectedIndex]),
      ),
      body: widgetList[selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, size: 36),
                      radius: 30,
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Dhruvik',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                itemClicked(0, context);
              },
              title: Text('Gallery'),
              leading: Icon(Icons.image),
            ),
            ListTile(
              onTap: () {
                itemClicked(1, context);
              },
              title: Text('Audio'),
              leading: Icon(Icons.audiotrack),
            ),
            ListTile(
              onTap: () {
                itemClicked(2, context);
              },
              title: Text('Video'),
              leading: Icon(Icons.video_camera_back),
            )
          ],
        ),
      ),
    );
  }
}
