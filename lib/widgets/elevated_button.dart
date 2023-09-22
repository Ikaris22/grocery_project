import 'package:flutter/material.dart';

import '../base/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final double buttonWidth;
  final String buttonName;
  final Function() onClick;

  const ElevatedButtonWidget({super.key, required this.buttonWidth, required this.buttonName, required this.onClick});
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
          onPressed: onClick,
          child: Text(
            buttonName,
            style: const TextStyle(fontSize: 18),
          )),
    );
  }
}
