import 'package:flutter/material.dart';
class TextButtonWidget extends StatelessWidget{
  const TextButtonWidget({super.key, required this.textButtonName, required this.onClick});
  final String textButtonName;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onClick,
        child: Text(
          textButtonName,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
        )) ;
  }

}