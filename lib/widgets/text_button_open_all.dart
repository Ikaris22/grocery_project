import 'package:flutter/material.dart';

import '../base/app_colors.dart';

class TextButtonOpenAll extends StatelessWidget {
  const TextButtonOpenAll({
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
          color: AppColors.greenColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
