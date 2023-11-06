import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';
class Decor extends StatelessWidget{
  final double height;
  Decor({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ClipOval(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.greenColor,
                width: 2.0,
              ),
              color: Colors.transparent,
            ),
          ),
        ),
        Container(
          height: height,
          width: 2,
          color: AppColors.greenColor,
        ),
      ],
    );
  }

}