import 'package:flutter/material.dart';

import '../49program/49program.dart';
import '../50program.dart';
import '../51program.dart';
import '../52program.dart';
import '../53program.dart';
import '../54program.dart';
import '../55program.dart';
import '../56program.dart';
import '../57program.dart';
import '../58program.dart';
import '../59program/LoginScreen.dart';
import '../60program/Homescreen.dart';
import 'Model/Program.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Module - 3', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  List<Question> questionList = [
    Question(programno: 49,question: 'Create below screens'),
    Question(programno: 50, question: 'Create an application to take input number from user and print itsreverse number in TextField'),
    Question(programno: 51,question: 'Create an application to input 2 numbers from user and all numbers between those 2 numbers in next activity'),
    Question(programno: 52,question: 'Create an application with radio buttons (Add, Substraction,Multiply, Division) EditText (number1, number2) and print result asper user choice from radio button in TextView'),
    Question(programno: 53,question: 'create an application to change background when button is clicked'),
    Question(programno: 54,question: ' create an application to increate font size when plus button click and decrease when minus button click'),
    Question(programno: 55,question: 'create an application to display Textview when checkbox is checked and hide otherwise'),
    Question(programno: 56,question: 'Write a program to show four images around Textview'),
    Question(programno: 57,question: 'Write a program in android display screen color which the Color will be select from the radio button.'),
    Question(programno: 58,question: 'Write a program you have taken three seek bar controls. From three Seekbar which Seekbar value changed the background color of device will be changed'),
    Question(programno: 59,question: 'Create login and registration form '),
    Question(programno: 60,question: 'Design below screens')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module - 3'),
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
      case 49:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program49(),
          ),
        );
        break;
      case 50:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program50(),
          ),
        );
        break;
      case 51:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program51(),
          ),
        );
        break;
      case 52:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program52(),
          ),
        );
        break;
      case 53:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program53(),
          ),
        );
        break;
      case 54:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program54(),
          ),
        );
        break;
      case 55:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program55(),
          ),
        );
        break;
      case 56:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program56(),
          ),
        );
        break;
      case 57:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program57(),
          ),
        );
        break;
      case 58:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program58(),
          ),
        );
        break;
      case 59:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program59(),
          ),
        );
        break;
      case 60:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Program60(),
          ),
        );
        break;
    }
  }
}