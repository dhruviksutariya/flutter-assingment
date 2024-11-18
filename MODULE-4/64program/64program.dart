import 'package:flutter/material.dart';

void main() => runApp(Program64());

class Program64 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: AlertList());
  }
}

class AlertList extends StatefulWidget {
  @override
  State<AlertList> createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  var selectedCity = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Select the city'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile(
                          title: Text('Ahmedabad'),
                          value: 'Ahmedabad',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Surat'),
                          value: 'Surat',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Rajkot'),
                          value: 'Rajkot',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Bhavnagar'),
                          value: 'Bhavnagar',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Vadodara'),
                          value: 'Vadodara',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Amreli'),
                          value: 'Amreli',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Junagdh'),
                          value: 'Junagdh',
                          groupValue: selectedCity,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                              Navigator.of(context).pop(); // Close dialog
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Click'),
            ),
            SizedBox(height: 20),
            Text(
              'Selected City: $selectedCity',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
