
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() => runApp(Program66());

class Program66 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: DataTime()
    );
  }
}

class DataTime extends StatefulWidget {
  const DataTime({Key? key}) : super(key: key);

  @override
  State<DataTime> createState() => _DataTimeState();
}

class _DataTimeState extends State<DataTime> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  DateTime selectedTime = DateTime.now();

  Timer? _timer;

  void updateTime() {
    setState(() {
      selectedTime = DateTime.now();
    });
  }

  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}',
                style: TextStyle(fontSize: 30)),
            Text(
                '${selectedTime.hour.toString().toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}:${selectedTime.second.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}
