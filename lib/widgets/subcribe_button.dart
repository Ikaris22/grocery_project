import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  final Color buttonColor;
  final Function() onclick;
  final String buttonName;
  final Color buttonNameColor;
  final BorderSide? border;

  const SubscribeButton(
      {super.key,
      required this.buttonColor,
      required this.buttonName,
      required this.onclick,
      required this.buttonNameColor,
      required this.border});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 28,
      child: ElevatedButton(
        onPressed: onclick,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            padding: EdgeInsets.zero,
            side: border),
        child: Text(buttonName,
            style: TextStyle(fontSize: 12, color: buttonNameColor)),
      ),
    );
  }
}
