import 'package:flutter/material.dart';

import '../../constant/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_login_button.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({super.key});

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 120,
              child: Icon(Icons.message,
                  size: 100, color: AppConstant.buttonColor),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Chatter',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: AppConstant.buttonColor),
            ),
            SizedBox(
              width: 16,
            ),
            const Text('WORLD MOST PRIVATE CHATTING APP'),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50, top: 10, bottom: 10),
              child: CustomButtonLogin(
                backgroundColor: AppConstant.buttonColor,
                text: 'Login',
                textColor: AppConstant.buttonColor,
                onClick: () {
                  Navigator.pushNamed(context, AppConstant.loginView);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50, top: 10, bottom: 10),
              child: CustomButton(
                backgroundColor: AppConstant.buttonColor,
                text: 'Signup',
                textColor: AppConstant.buttonTextColor,
                onClick: () {
                  Navigator.pushNamed(context, AppConstant.signupView);
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Made with '),
                Icon(Icons.favorite, color: Colors.red),
                Text(' by Dhruv'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
