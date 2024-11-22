import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../Model/task.dart';
import '../database/db_helper.dart';
import 'add_task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Task> _tasks = [];

  DbHelper _dbHelper = DbHelper();

  Future<void> updateTask(Task task, BuildContext context) async {
    int result = await _dbHelper.updateRecord(task);
    if (result > 0) {
      Fluttertoast.showToast(msg: 'Record updated successfully..');
      print('Record updated successfully..');
    } else {
      print('Getting error..');
    }
  }

  Future<void> deleteUser(Task task, BuildContext context) async {
    int result = await _dbHelper.deleteRecord(task);
    if (result > 0) {
      setState(() {
        _tasks.removeWhere((element) => element.id == task.id);
      });
      Fluttertoast.showToast(msg: 'Record Delete successfully..');
      print('$result - Recored Delete successfully');
      // Navigator.pop(context, task);
    } else {
      print('$result - Error');
      // Navigator.pop(context, null);
    }
  }

  Future<void> edittask(Task task, BuildContext context) async {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUserList();
  }

  Future<void> _fetchUserList() async {
    var tempList = await _dbHelper.getAllRecords();
    setState(() {
      _tasks = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ))),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  Task task = _tasks[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(
                                task.name,
                                style: TextStyle(fontSize: 18),
                              ),
                              popUpMenu(task),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(task.description,
                              style: TextStyle(fontSize: 15)),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                  DateFormat('dd-MM-yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          int.parse('${task.createdAt}'))),
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*child: ListTile(
                    title: Text(task.name, style: TextStyle(fontSize: 22)),
                    subtitle: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            int.parse('${task.createdAt}')))),
                    trailing: popUpMenu(task),
                  ),*/
                    color: cardColor(task),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task? task = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              )) ??
              null;

          if (task != null) {
            setState(() {
              _tasks.insert(0, task);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }



  cardColor(Task task) {
    if (task.completed == 'true') {
      return Colors.grey;
    } else if (task.priority == 'High') {
      return Colors.red;
    } else if (task.priority == 'Average') {
      return Colors.blue;
    } else if (task.priority == 'Low') {
      return Colors.green;
    }
  }

  popUpMenu(Task task) {
    return PopupMenuButton<String>(
      onSelected: (String result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          onTap: () {
            setState(() {
              task.completed = 'true';
              updateTask(task, context);
            });
          },
          child: Text('Complete Task'),
        ),
        PopupMenuItem<String>(
          onTap: () {
            setState(() {
              deleteUser(task, context);
            });
          },
          child: Text('Delete Task'),
        ),
        PopupMenuItem<String>(
          onTap: () async {
            Task? etask = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(task: task) ,
                )
            ) ?? null;

            if(etask != null){
              _fetchUserList();
            }
          },
          child: Text('Updeta Task'),
        ),
      ],
    );
  }

}

