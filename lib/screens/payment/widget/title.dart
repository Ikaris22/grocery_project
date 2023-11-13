import 'package:flutter/material.dart';

import '../../../base/app_fonts.dart';
class TitlePayment extends StatelessWidget{
  final String title;
  final double fontSize;
  const TitlePayment({super.key, required this.title,required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style:  TextStyle(
            fontSize: fontSize,
            fontFamily: AppFonts.monserratSemiBold,
          ),
        ),
      ],
    );
  }

}