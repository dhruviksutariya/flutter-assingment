import 'package:flutter/material.dart';
import '../model/File.dart';
class VideoScreen extends StatelessWidget {
List<Video> _videoList=[
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 1',
      length: '2:00'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 2',
      length: '1:00'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 3',
      length: '3:00'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 4',
      length: '1:20'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 5',
      length: '2:10'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 6',
      length: '2:02'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 7',
      length: '0:20'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 8',
      length: '3:20'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 9',
      length: '4:00'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 10',
      length: '2:11'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 11',
      length: '1:14'),
  Video(
      thumbnail: NetworkImage('https://i2.wp.com/anniewearsit.com/wp-content/uploads/2018/05/1.27.18_3222.jpg?w=2874&h=1917&ssl=1'),
      name: 'Video 12',
      length: '0:20'),

];
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey.shade100,
        child: ListView.builder(
          itemCount: _videoList.length,
          itemExtent: 100,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () {},
            padding: EdgeInsets.all(4.0),
            child: Container(
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black26,
                            image: DecorationImage(
                                image: _videoList[index].thumbnail,
                                fit: BoxFit.fitWidth)),
                      ),
                      Center(
                        widthFactor: 3.3,
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white70.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _videoList[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(_videoList[index].length),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


