import 'package:flutter/material.dart';

import 'Model/User.dart';
import 'Userscreen.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  State<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  List<User> userList = [];

  void _removestudent(User user) {
    setState(() {
      userList.removeWhere(
        (U) => U.Fname == user.Fname,
      );
    });
  }

  void _updateRecord(User user) {
    var index = userList.indexWhere((element) => element.Fname == user.Fname);

    if (index != -1) {
      setState(() {
        userList[index] = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            User? user = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Userscreen1(
                    user: null,
                  ),
                ));
            if (user != null) {
              userList.add(user);
              print('student added successfully..');
            }
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: userList.length,
            itemBuilder: (context, index) {
              User user = userList[index];

              return Card(
                elevation: 2,
                child: Container(
                  height: 180,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text(
                          '${user.Fname[0].toUpperCase() + user.Lname[0].toUpperCase()}',
                        ),
                      ),
                      
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${user.Fname + user.Lname}',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                PopupMenuButton(
                                  onSelected: (value) async {
                                    switch (value) {
                                      case 0:
                                        User? U = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Userscreen1(
                                                user: user,
                                              ),
                                            ));
                                        if (U != null) {
                                          _updateRecord(U);
                                        }
                                        // navigate to edit screen
                                        break;
                                      case 1:
                                        // show delete dialog
                                        var action = await _showAlertDialog(
                                            context,
                                            'Alert',
                                            'This item will be removed permanently.');
                                        if (action) {
                                          _removestudent(user);
                                        }
                                        break;
                                      case 2:
                                        var action = _showExitDialog(context);
                                        break;
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text('Edit'),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Text('Exit'),
                                      value: 2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '${user.Email}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'CONTACT : ',
                                style: TextStyle(color: Colors.purple),
                                children: [
                                  TextSpan(
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    text: '${user.Contact}',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'DOB : ',
                                      style: TextStyle(color: Colors.purple),
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          text: '${user.Dob}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Address : ',
                                      style: TextStyle(color: Colors.purple),
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          text: '${user.Address}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future<bool> _showAlertDialog(
      BuildContext context, String title, String message) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Yse'),
          ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Are you sure want to exit the application?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
}
