import 'package:flutter/material.dart';

import '../base/app_colors.dart';

class SmallElevatedButton extends StatelessWidget {
  final double buttonWidth;
  final String buttonName;
  final Function() onClick;

  const SmallElevatedButton({
    super.key,
    required this.buttonWidth,
    required this.onClick,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: buttonWidth,
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onClick,
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
