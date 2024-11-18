import 'package:flutter/material.dart';
class MeetApp extends StatefulWidget {
  @override
  State<MeetApp> createState() => _MeetAppState();
}

class _MeetAppState extends State<MeetApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    DrawerButton(
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.white)),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Meet',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: Text(
                        'DS',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(129, 211, 225, 1))),
                          onPressed: () {},
                          child: Text(
                            'New meeting',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                Color.fromRGBO(129, 211, 225, 100))),
                        onPressed: () {},
                        child: Text(
                          'Join with a code',
                          style: TextStyle(
                              color: Color.fromRGBO(129, 211, 225, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.63,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CircleAvatar(

                            backgroundColor: Colors.lightBlue,
                            foregroundImage:
                            AssetImage('image/meet-app.jpg'),
                            radius: 90,
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: 260,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Get a link that you can share',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: 260,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Tap New meeting to get a link that you can send to people that you want to meet with',
                              style: TextStyle(
                                color: Colors.blueGrey.shade200,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Color.fromRGBO(129, 211, 225, 1),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.white38,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
