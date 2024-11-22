import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constant/constants.dart';
import '../../firebase/firebase_service.dart';
import '../../model/allUser.dart';
import '../../model/messages.dart';

class ChatScreen extends StatefulWidget {
  AllUser? allUser;

  ChatScreen({required this.allUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  var cU = FirebaseAuth.instance.currentUser;

  FirebaseService _service = FirebaseService();

  List<Message> _msgList = [];

  String _msg = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppConstant.bgColor,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppConstant.buttonColor,
        iconTheme: IconThemeData(color: AppConstant.buttonTextColor),
        title: Text('${widget.allUser!.fName}',
            style: TextStyle(
                color: AppConstant.buttonTextColor,
                fontWeight: FontWeight.w500)),
        actions: [
          PopupMenuButton(
            iconColor: AppConstant.buttonTextColor,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Logout'),
                  onTap: () {
                    // showAlertDialog(context);
                  },
                )
              ];
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            // child: Container(),
            child: StreamBuilder(
              stream: _service.getAllMessages(
                  allUser: AllUser(
                      id: widget.allUser!.id,
                      fName: widget.allUser!.fName,
                      lName: widget.allUser!.lName,
                      email: widget.allUser!.email,
                      password: widget.allUser!.password,
                      createdAt: widget.allUser!.createdAt)),
              builder: (context, snapshot) {
                final msgList = [];
                final toId = [];
                final sentTime = [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error.toString()}'),
                  );
                } else {
                  final msg = snapshot.data!.docs;
                  for (var i in msg) {
                    print(msg);
                    msgList.add(i.data()['msg']);
                    toId.add(i.data()['toId']);
                    sentTime.add(i.data()['sent']);
                  }
                  if (msg.isNotEmpty) {
                    return ListView.builder(
                        itemCount: msgList.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          // Messages messages = msgList[index];
                          DateTime dateTime =
                              DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(sentTime[index]));
                          String formattedTime =
                              DateFormat.jm().format(dateTime);
                          // bool select = toId == widget.allUser!.id ? true :false;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Align(
                              alignment: toId[index] == widget.allUser!.id
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: toId[index] == widget.allUser!.id
                                      ? Color.fromARGB(255, 221, 245, 255)
                                      : Color.fromARGB(100, 255, 255, 100),
                                  border: Border.all(
                                      color: toId[index] == widget.allUser!.id
                                          ? Colors.lightBlue
                                          : Colors.yellow.shade700),
                                  borderRadius:
                                      toId[index] == widget.allUser!.id
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(spellOut: false,
                                          text: '${msgList[index]}',
                                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '    $formattedTime',
                                              style: TextStyle(color: Colors.grey,  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Text(
                                      //   '${msgList[index]}',
                                      //   style: TextStyle(fontSize: 18),
                                      // ),
                                      SizedBox(width: 50,),
                                      // SizedBox(
                                      //   width: toId[index] == widget.allUser!.id
                                      //       ? 100
                                      //       : 0,
                                      // ),
                                      // Text('$formattedTime'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text(
                        'Say hello..\u{1F44B}',
                        style: TextStyle(fontSize: 22),
                      ),
                    );
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 16),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: 'Type your message here..',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: AppConstant.cardTextColor,
                          fontSize: 18,
                        ),
                      ),
                      onSaved: (value) {
                        _msg = value ?? '';
                      },
                    ),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_msg);
                        if (_msg.isNotEmpty) {
                          if (_msgList.isEmpty) {
                            //on first message (add user to my_user collection of chat user)
                            _service.sendFirstMessage(
                                widget.allUser!, _msg, Type.text);
                            _controller.clear();

                            print('Msg send!');
                          } else {
                            //simply send message
                            _service.sendMessage(
                                widget.allUser!, _msg, Type.text);
                          }
                          _msg = '';
                        }
                      }
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppConstant.buttonColor,
                      child:
                          Icon(Icons.send, color: AppConstant.buttonTextColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
