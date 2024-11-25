import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constant/constants.dart';
import '../../preference/pref_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      var user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Navigate to home
        Navigator.pushNamedAndRemoveUntil(context, AppConstant.homeView, (route) => false);
      } else {
        // Navigate to OnBoarding
        Navigator.pushNamedAndRemoveUntil(context, AppConstant.onBoardingView, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 120,
                child: Icon(Icons.message, size: 100, color: AppConstant.buttonColor),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Chatter',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppConstant.buttonColor),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
