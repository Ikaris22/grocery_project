import 'package:flutter/material.dart';

import '../base/app_colors.dart';
class GreenButton extends StatelessWidget{
  const GreenButton({super.key, required this.buttonWidth, required this.buttonName});
final double buttonWidth ;
final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.zero,
    width: buttonWidth,
    height: 45,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 18),
        )),
    );
  }
}