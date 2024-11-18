import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Item {
  String title;
  Widget body;
  Icon icon;
  Icon activeIcon;

  Item({
    required this.title,
    required this.body,
    required this.icon,
    required this.activeIcon,
  });
}

class Video {
  NetworkImage thumbnail;
  String name;
  String length;

  Video({required this.thumbnail, required this.name, required this.length});

}

class Music {

  String artist;
  String song;
  String album;

  Music({required this.artist, required this.song, required this.album});
}