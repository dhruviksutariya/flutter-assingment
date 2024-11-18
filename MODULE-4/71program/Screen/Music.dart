import 'package:flutter/material.dart';
import '../model/File.dart';
class MusicScreen extends StatelessWidget {
  List<MusicS> _audioList = [
    MusicS(artist: 'Atif Aslam', song: 'Aadat', album: 'Aadat'),
    MusicS(artist: 'Arjit Singh', song: 'Kesariya', album: 'Brahmastra'),
    MusicS(artist: 'Adnan Sami', song: 'Bhar Do jholi Meri', album: 'album'),
    MusicS(artist: 'Alan Walker', song: 'Alone', album: 'Alone'),
    MusicS(artist: 'AR Rahman', song: 'Kun faya Kun', album: 'Rockstar'),
    MusicS(artist: 'AP Dhillon', song: 'Excused', album: 'Excuses'),
    MusicS(artist: 'AP Dhillon', song: 'Brown Munde', album: 'Brown Munde'),
    MusicS(artist: 'Rafi', song: 'Gulabi Aankhen', album: 'album'),
    MusicS(artist: 'Rosa Linn', song: 'Snap', album: 'Snap'),
    MusicS(artist: 'Shubh', song: 'King Shit', album: 'king shit'),
    MusicS(artist: 'Shub', song: 'Cheques', album: 'cheques'),
    MusicS(artist: 'Ghost', song: 'Mary On a Cross', album: 'album'),
    MusicS(artist: 'Justin Beiber', song: 'Yummy', album: 'album'),
    MusicS(artist: 'The Weekend', song: 'Blinding Lights', album: 'album'),
    MusicS(artist: 'Avicii', song: 'The Nights', album: 'album'),
    MusicS(artist: 'Jaynes Young', song: 'Infinity', album: 'album'),
    MusicS(artist: 'Ed Sheeran', song: 'Perfect', album: 'album'),
    MusicS(artist: 'Sia', song: 'Unstoppable', album: 'album'),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        height: double.maxFinite,
        child: ListView.builder(
          itemCount: _audioList.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {},
              title: Text(
                _audioList[index].song,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: Row(
                children: [
                  Row(children: [
                    Icon(Icons.album),
                    Text(_audioList[index].album),
                  ]),
                  Row(children: [
                    Icon(Icons.mic),
                    Text(_audioList[index].artist),
                  ])
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.play_circle_fill_outlined),
                      title: Text('Play'),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.delete_forever_outlined),
                      title: Text('Delete'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}


