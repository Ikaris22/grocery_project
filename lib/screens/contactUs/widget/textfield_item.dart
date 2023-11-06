import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';
import '../../../base/app_fonts.dart';

class TextFieldItem extends StatelessWidget {
  final String hintText;
  final double height;
  const TextFieldItem(
      {super.key, required this.height, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.dividerColor),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: const TextStyle(
            fontFamily: AppFonts.monserratRegular,
            fontSize: 18,
            color: AppColors.subscriptionQty,
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.only(
            top: 20,
            bottom: 16,
            left: 20,
          ),
        ),
      ),
    );
  }
}
