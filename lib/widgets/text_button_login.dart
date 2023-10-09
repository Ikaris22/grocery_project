import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';

class TextButtonLogin extends StatelessWidget {
  const TextButtonLogin({
    super.key,
    required this.textButtonName,
    required this.onClick,
  });

  final String textButtonName;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        textButtonName,
        style: const TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
