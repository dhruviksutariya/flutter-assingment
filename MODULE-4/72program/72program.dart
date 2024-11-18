import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(Program72());

class Program72 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program72',
      home: CallDialog()
    );
  }
}

class CallDialog extends StatefulWidget {
  @override
  _CallDialogState createState() => _CallDialogState();
}

class _CallDialogState extends State<CallDialog> {
  @override
  void initState() {
    super.initState();
    _requestPhoneCallPermission();
  }

  Future<void> _requestPhoneCallPermission() async {

    var status = await Permission.phone.status;
    if (status.isGranted) {
      return;
    }


    if (await Permission.phone.request().isGranted) {

      print("Phone call permission granted!");
    } else {

      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Required"),
          content: Text("This app requires phone call permission."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Deny"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _openAppSettings();
              },
              child: Text("Allow"),
            ),
          ],
        );
      },
    );
  }

  void _openAppSettings() async {

    await launch('app-settings:');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Phone Call App Content"),
      ),
    );
  }
}