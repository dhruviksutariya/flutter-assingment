import 'package:flutter/cupertino.dart';

class Items {
  String title;
  Widget body;
  Icon icon;


  Items({
    required this.title,
    required this.body,
    required this.icon,
  });
}

class VideoS {
  NetworkImage thumbnail;
  String name;
  String length;

  VideoS({required this.thumbnail, required this.name, required this.length});

}

class MusicS {

  String artist;
  String song;
  String album;

  MusicS({required this.artist, required this.song, required this.album});
}