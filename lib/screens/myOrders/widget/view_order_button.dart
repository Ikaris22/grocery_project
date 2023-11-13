import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';
class ViewOrderButton extends StatefulWidget{
  const ViewOrderButton({super.key});

  @override
  State<StatefulWidget> createState()=> _ViewOrderButton();

}

class _ViewOrderButton extends State<ViewOrderButton>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        height:36,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.greenColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4)
        ),
        child: const Text(
          'View order details',
          style: TextStyle(
            color: AppColors.greenColor
          ),
        ),
      ),
    );
  }
}