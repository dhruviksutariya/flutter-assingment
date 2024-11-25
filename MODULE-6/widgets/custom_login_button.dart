import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  Color backgroundColor;
  String text;
  Color textColor;
  VoidCallback onClick;

  CustomButtonLogin(
      {required this.backgroundColor,
      required this.text,
      required this.textColor,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: backgroundColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
