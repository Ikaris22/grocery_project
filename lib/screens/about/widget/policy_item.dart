import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';

class PolicyItem extends StatelessWidget {
  final String text;
  final Function() onClick;
  const PolicyItem({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      padding: const EdgeInsets.only(left: 16, right: 20),
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.profileColor,
          borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: AppFonts.monserratRegular,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
