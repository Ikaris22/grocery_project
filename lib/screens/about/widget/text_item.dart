import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_fonts.dart';
class TextItem extends StatelessWidget{
  final String text;
  const TextItem({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.monserratRegular,
        fontSize: 14,
        height: 1.9
      ),
    );
  }

}