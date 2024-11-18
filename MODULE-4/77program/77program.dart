import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(Program77());

class Program77 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:  Scaffold(
        body: Center(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      makePhoneCall('9313626698'); // Replace with the actual phone number
                    },
                    child: Text('Call'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendSMS('Hello, this is a test message!', '9313626698'); // Replace with the actual phone number
                    },
                    child: Text('Send SMS'),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  void sendSMS(String message, String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );
    await launchUrl(launchUri);

  }
}
