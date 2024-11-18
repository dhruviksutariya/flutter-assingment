import 'package:flutter/material.dart';
import '../model/File.dart';
class MusicScreen extends StatelessWidget {
  List<Music> _audioList = [
    Music(artist: 'Atif Aslam', song: 'Aadat', album: 'Aadat'),
    Music(artist: 'Arjit Singh', song: 'Kesariya', album: 'Brahmastra'),
    Music(artist: 'Adnan Sami', song: 'Bhar Do jholi Meri', album: 'album'),
    Music(artist: 'Alan Walker', song: 'Alone', album: 'Alone'),
    Music(artist: 'AR Rahman', song: 'Kun faya Kun', album: 'Rockstar'),
    Music(artist: 'AP Dhillon', song: 'Excused', album: 'Excuses'),
    Music(artist: 'AP Dhillon', song: 'Brown Munde', album: 'Brown Munde'),
    Music(artist: 'Rafi', song: 'Gulabi Aankhen', album: 'album'),
    Music(artist: 'Rosa Linn', song: 'Snap', album: 'Snap'),
    Music(artist: 'Shubh', song: 'King Shit', album: 'king shit'),
    Music(artist: 'Shub', song: 'Cheques', album: 'cheques'),
    Music(artist: 'Ghost', song: 'Mary On a Cross', album: 'album'),
    Music(artist: 'Justin Beiber', song: 'Yummy', album: 'album'),
    Music(artist: 'The Weekend', song: 'Blinding Lights', album: 'album'),
    Music(artist: 'Avicii', song: 'The Nights', album: 'album'),
    Music(artist: 'Jaynes Young', song: 'Infinity', album: 'album'),
    Music(artist: 'Ed Sheeran', song: 'Perfect', album: 'album'),
    Music(artist: 'Sia', song: 'Unstoppable', album: 'album'),
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


