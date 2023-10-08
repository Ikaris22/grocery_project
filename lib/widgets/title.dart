import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';

class TitleName extends StatelessWidget {
  final String title;

  const TitleName({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 19,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
