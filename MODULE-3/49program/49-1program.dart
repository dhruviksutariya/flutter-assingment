import 'package:flutter/material.dart';


class fisrdesign extends StatefulWidget {
  @override
  State<fisrdesign> createState() => _fisrdesignState();
}

class _fisrdesignState extends State<fisrdesign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('1assingment'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                      image: NetworkImage(
                          'https://www.hlimg.com/images/places2see/738X538/Rajmachi-Fort-in-Lonavala-and-Khandala-Kandoi-sid-wikimedia_0.jpg')),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lnavala Khandala',style: TextStyle(fontSize: 25),),
                          Text('Tiger Point',style: TextStyle(fontSize: 18))
                        ],
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Icon(Icons.star,color: Colors.red,),
                         Text('41')
                       ],
                     )
                    ],
                  ),
                  // ListTile(
                  //     title: Text(
                  //       'lonavala khandala',
                  //       style: TextStyle(fontSize: 25, color: Colors.black87),
                  //     ),
                  //     subtitle: Text(
                  //       'tiger point',
                  //       style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  //     ),
                  //     trailing: Icon(
                  //       Icons.star,
                  //       color: Colors.red,
                  //
                  //     )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.blue,
                            size: 25,
                          ),
                          Text('call')
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.near_me,
                            color: Colors.blue,
                            size: 25,
                          ),
                          Text('route')
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.blue,
                            size: 25,
                          ),
                          Text('share')
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Lonavala and Khandala are twin picturesque hill stations in Maharashtra, India.'
                    'They serve as perfect weekend getaways for those seeking respite from the hustle and bustle of city life.'
                    'Located just 4.6 kilometers apart, these hill stations offer stunning views of the Western Ghats12.'
                    'Lonavala, situated at an elevation of 624 meters above sea level, is known for its production of the '
                    'hard candy chikki and serves as a major stop on the railway line connecting Mumbai and Pune. '
                    'The region is also home to INS Shivaji, the Indian Navy’s premier technical training institute1.'
                    'When you visit, be sure to explore attractions like Bhaja Caves, Bushi Dam, Karla Caves, and Rajmachi Fort3.'
                    ' 🌄🌿',textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
