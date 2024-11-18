import 'package:flutter/material.dart';
class ComposeEmail extends StatefulWidget {
  const ComposeEmail({super.key});

  @override
  State<ComposeEmail> createState() => _ComposeEmailState();
}

class _ComposeEmailState extends State<ComposeEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.attachment_rounded,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.send_outlined,
                color: Colors.white,
              )),
          PopupMenuButton(
            color: Color.fromRGBO(11, 21, 22, 1),
            iconColor: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Schedule send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Add from Contacts',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Confidential mode',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Save draft',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Discard',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Help and Feedback',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        height: 600,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'From',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: TextField(
                      enableSuggestions: true,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'To',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Subject',
                        hintStyle:
                        TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Compose email',
                        hintStyle:
                        TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
