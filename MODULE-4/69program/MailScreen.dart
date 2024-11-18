import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class MailScreen extends StatefulWidget {
  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          appBar(),
          mailBody(),
        ],
      ),
    );
  }
}

mailBody() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Primary',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.blueGrey,
                ),
                title: Text(
                  'Coursera',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'hsdfbd gi gdsiu gsayig asiy sagy asgfys gfasyfgsyfg ',style: TextStyle(color: Colors.white70),),
                trailing: Column(
                  children: [
                    Text(DateTime.now().hour.toString() +
                        ' : ' +
                        DateTime.now().minute.toString(),style: TextStyle(color: Colors.white),),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border,
                          size: 30,
                          color: Colors.grey,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              )
            ],
          ),
        )
      ],
    ),
  );
}

appBar() {
  return Container(
    height: 65,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45),
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
    child: ListTile(
      contentPadding: EdgeInsets.only(right: 16),
      leading: DrawerButton(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),
      ),
      title: TextField(
        cursorColor: Colors.white38,
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
            hintText: 'Search in emails',
            hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
            border: InputBorder.none),
      ),
      trailing: CircleAvatar(
        child: Text(
          'DS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    ),
  );
}
