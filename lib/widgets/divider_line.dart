import 'package:flutter/material.dart';
import '../base/app_colors.dart';
class DividerLine extends StatelessWidget{
  final String title;
  const DividerLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 0, right: 10),
            child: const Divider(
              color: AppColors.miniTextColor,
            )),
      ),
       Text(title,
        style: const TextStyle(
            color: AppColors.miniTextColor,
            letterSpacing: 1.3 ),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10, right: 0),
            child: const Divider(
              color: AppColors.miniTextColor,
            )),
      ),
    ]);
  }

}