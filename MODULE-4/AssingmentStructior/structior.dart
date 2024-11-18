import 'package:flutter/material.dart';
import '../60-2program/main.dart';
import '../61program/61program.dart';
import '../62program/62program.dart';
import '../63program/63program.dart';
import '../64program/64program.dart';
import '../65program/65program.dart';
import '../66program/66program.dart';
import '../67program/67program.dart';
import '../68program/68program.dart';
import '../69program/69program.dart';
import '../70program/70program.dart';
import '../71program/71program.dart';
import '../72program/72program.dart';
import '../73program/73program.dart';
import '../74program/74program.dart';
import '../75program/75program.dart';
import '../76program/76program.dart';
import '../77program/77program.dart';
import '../78program/Fomekeyvalidation/precticeprectical/main.dart';
import 'Model/Program.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Module - 4', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  List<Question> questionList = [
    Question(programno: 60,question: 'Create below screens'),
    Question(programno: 61, question: 'Create custom toolbar as per given below design Create toolbar with spinner and search functionality'),
    Question(programno: 62,question: 'Write a code to display simple alert dialog with title, description and icon when button is clicked'),
    Question(programno: 63,question: 'Write a code to display alert dialog with positive, negative and neutral button and display toast respectively users choice'),
    Question(programno: 64,question: 'Write a code to display alert dialog with list of cities and Single choice selection display selected city in TextView'),
    Question(programno: 65,question: 'open alert dialog when user want to exit from the application'),
    Question(programno: 66,question: 'Write a code to select Date on button,s click event'),
    Question(programno: 67,question: 'Write a code to display profile and logout option in options menu'),
    Question(programno: 68,question: 'Write a code to display edit, view, delete options with context menu  in listview and also perform respective operation on users choice'),
    Question(programno: 69,question: 'Create an application like gmail and display Screens according to user selection and design each page with dummy data'),
    Question(programno: 70,question: 'Create an application with bottom navigation with 3 tabs Gallery, audio and video and design each page with dummy data'),
    Question(programno: 71,question: 'Create an application with Navigation Drawer with 3 tabs Gallery, audio and video and design each page with dummy data'),
    Question(programno: 72, question: 'create a Phone call App when user first time open the app it will automatically generate one dialog which has two option allow, deny if click on allow permission is grant in settings'),
    Question(programno: 73, question: 'Write a code to display Splash Screen using Activity'),
    Question(programno: 74, question: 'Write a code to redirect user from one activity to another when button click.'),
    Question(programno: 75, question: 'Create an Android Application which Manage Activity Lifecycle Stages and Showing Toast with Performing Different Stages.'),
    Question(programno: 76, question: 'Create an Application to take input two numbers from users and when user press button then display sum of those values of next Activity.'),
    Question(programno: 77, question: 'Call via urllauncher, Send Sms via urllauncher'),
    Question(programno: 78, question: 'Write a program to add name from the text view and insert into the listview. If you click on the listview then name should be show in the'
        'dialog box. When user press for 2 seconds on particular List item then open Context Menu (Delete Item, Edit Item, Exit). If user click on'
        'Delete Item then Open one Alert Dialog with message (“Are you sure want to delete Item?”) and yes, no button if user press yes button then'
        'remove item from list. (Click a DELETE button, it gives a confirm box) If user click on Edit item then selected item display on EditText and'
        'again user click on button then this (updated item) should be replace with old item'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module - 4'),
      ),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (context, index) {
          Question question = questionList[index];

          return Card(
            child: ListTile(
              onTap: () {
                _itemClicked(question, context);
              },
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade300,
                child: Text(
                  '${question.programno}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(question.question),
              trailing: Icon(Icons.navigate_next),
            ),
          );
        },
      ),
    );
  }

  void _itemClicked(Question question, BuildContext context) {
    switch (question.programno) {
      case 60:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program602(),
          ),
        );
        break;
      case 61 :
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program61(),
          ),
        );
        break;
      case 62:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program62(),
          ),
        );
        break;
      case 63:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program63(),
          ),
        );
        break;
      case 64:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program64(),
          ),
        );
        break;
      case 65:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program65(),
          ),
        );
        break;
      case 66:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program66(),
          ),
        );
        break;
      case 67:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program67(),
          ),
        );
        break;
      case 68:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program68(),
          ),
        );
        break;
      case 69:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program69(),
          ),
        );
        break;
      case 70:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program70(),
          ),
        );
        break;
      case 71:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program71(),
          ),
        );
        break;
      case 72:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program72(),
          ),
        );
        break;
      case 73:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program73(),
          ),
        );
        break;
      case 74:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program74(),
          ),
        );
        break;
      case 75:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program75(),
          ),
        );
        break;
      case 76:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program76(),
          ),
        );
        break;
      case 77:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program77(),
          ),
        );
        break;
      case 78:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program78(),
          ),
        );
        break;
    }
  }
}