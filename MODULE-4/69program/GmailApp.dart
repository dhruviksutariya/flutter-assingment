import 'package:flutter/material.dart';

import '69program.dart';
import 'ComposeEmail.dart';
import 'MailScreen.dart';
import 'MeetApp.dart';
class GmailApp extends StatefulWidget {
  const GmailApp({super.key});

  @override
  State<GmailApp> createState() => _GmailAppState();
}

class _GmailAppState extends State<GmailApp> {
  int _bottomNavIndex = 0;
  List<Widget> _navitem = [
    MailScreen(),
    MeetApp(),
  ];
  var _drawerIndex = 1;
  Color _mailColor = Colors.indigo;
  Color _meetColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _bottomNavIndex == 0
          ? FilledButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStatePropertyAll(Colors.indigo),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15))),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComposeEmail(),
              ));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit,
              color: Colors.blue.shade100,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Compose',
              style: TextStyle(fontSize: 15, color: Colors.blue.shade100),
            ),
          ],
        ),
      )
          : null,
      backgroundColor: Colors.black,
      body: _navitem[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              _mailColor = Colors.indigo;
              _meetColor = Colors.black;
              setState(() {
                _bottomNavIndex = value;
              });
              break;
            case 1:
              _mailColor = Colors.black;
              _meetColor = Colors.indigo;
              setState(() {
                _bottomNavIndex = value;
              });
              break;
          }
        },
        currentIndex: _bottomNavIndex,
        backgroundColor: Colors.black45,
        selectedItemColor: Colors.blue.shade100,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 24)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                    backgroundColor: MaterialStatePropertyAll(_mailColor)),
                onPressed: () {
                  _mailColor = Colors.indigo;
                  _meetColor = Colors.black;
                  setState(() {
                    _bottomNavIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 24)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                    backgroundColor: MaterialStatePropertyAll(_meetColor)),
                onPressed: () {
                  _mailColor = Colors.black;
                  _meetColor = Colors.indigo;
                  setState(() {
                    _bottomNavIndex = 1;
                  });
                },
                icon: Icon(Icons.photo_camera_front),
                color: Colors.white,
              ),
              label: '')
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                height: 60,
                child: Text(
                  'Gmail',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Divider(
                height: 0.5,
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 0,
                onTap: () {
                  setState(() {
                    _drawerIndex = 0;
                  });
                },
                leading: Icon(
                  Icons.all_inbox,
                  color: Colors.white,
                ),
                title: Text(
                  'All inboxes',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 1,
                onTap: () {
                  setState(() {
                    _drawerIndex = 1;
                  });
                },
                leading: Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Primary',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 2,
                onTap: () {
                  setState(() {
                    _drawerIndex = 2;
                  });
                },
                leading: Icon(
                  Icons.add_home_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Promotions',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 3,
                onTap: () {
                  setState(() {
                    _drawerIndex = 3;
                  });
                },
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Social',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'All labels',
                  style: TextStyle(fontSize: 13, color: Colors.white38),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 4,
                onTap: () {
                  setState(() {
                    _drawerIndex = 4;
                  });
                },
                leading: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                title: Text(
                  'Starred',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 5,
                onTap: () {
                  setState(() {
                    _drawerIndex = 5;
                  });
                },
                leading: Icon(
                  Icons.snooze_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Snoozed',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 6,
                onTap: () {
                  setState(() {
                    _drawerIndex = 6;
                  });
                },
                leading: Icon(
                  Icons.label_important_outline,
                  color: Colors.white,
                ),
                title: Text(
                  'Social',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 7,
                onTap: () {
                  setState(() {
                    _drawerIndex = 7;
                  });
                },
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Important',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 8,
                onTap: () {
                  setState(() {
                    _drawerIndex = 8;
                  });
                },
                leading: Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Sent',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 9,
                onTap: () {
                  setState(() {
                    _drawerIndex = 9;
                  });
                },
                leading: Icon(
                  Icons.schedule_send,
                  color: Colors.white,
                ),
                title: Text(
                  'Scheduled',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 10,
                onTap: () {
                  setState(() {
                    _drawerIndex = 10;
                  });
                },
                leading: Icon(
                  Icons.outbox,
                  color: Colors.white,
                ),
                title: Text(
                  'Outbox',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 11,
                onTap: () {
                  setState(() {
                    _drawerIndex = 11;
                  });
                },
                leading: Icon(
                  Icons.contact_page_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Drafts',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 12,
                onTap: () {
                  setState(() {
                    _drawerIndex = 12;
                  });
                },
                leading: Icon(
                  Icons.mail_outline_sharp,
                  color: Colors.white,
                ),
                title: Text(
                  'All mails',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 13,
                onTap: () {
                  setState(() {
                    _drawerIndex = 13;
                  });
                },
                leading: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Spam',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.indigo,
                selected: _drawerIndex == 14,
                onTap: () {
                  setState(() {
                    _drawerIndex = 14;
                  });
                },
                leading: Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Bin',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'Google Apps',
                  style: TextStyle(fontSize: 13, color: Colors.white38),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                title: Text(
                  'Calender',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.contacts_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Contacts',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.help_outline_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Help and feedback',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
