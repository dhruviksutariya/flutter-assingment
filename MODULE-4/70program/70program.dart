import 'package:flutter/material.dart';
import 'package:flutter_modules/MODULE-4/70program/Screen/Gellary.dart';
import 'package:flutter_modules/MODULE-4/70program/Screen/Music.dart';
import 'package:flutter_modules/MODULE-4/70program/Screen/Video.dart';
import 'package:flutter_modules/MODULE-4/70program/model/File.dart';

void main() => runApp(Program70());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program70',
      home: Program70(),
    );
  }

class Program70 extends StatefulWidget {
  @override
  State<Program70> createState() => _Program70State();
}

class _Program70State extends State<Program70> {
  int _SelectedIndex = 0;

  List<Item> fileList =[
    Item(title: 'Gellary', body: GellaryScreen(), icon:Icon(Icons.photo_outlined), activeIcon:Icon(Icons.photo),),
    Item(title: 'Music', body: MusicScreen(), icon:Icon(Icons.music_note_outlined), activeIcon:Icon(Icons.music_note_rounded),),
    Item(title: 'Video', body: VideoScreen(), icon:Icon(Icons.movie_creation_outlined), activeIcon:Icon(Icons.movie),)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       // backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(fileList[_SelectedIndex].title),
        ),
        body: Center(
          child: fileList[_SelectedIndex].body,
          ),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.pinkAccent,
          selectedItemColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade200,

          currentIndex: _SelectedIndex,

          onTap: (value) {
            setState(() {
              _SelectedIndex = value;
            });
          },

          items: List.generate(fileList.length,(index) =>BottomNavigationBarItem(icon: fileList[index].icon,
          backgroundColor: Colors.black,
          label: fileList[index].title,
          activeIcon: fileList[index].activeIcon,
          )
        ),
      )
    )
    );
  }
}


