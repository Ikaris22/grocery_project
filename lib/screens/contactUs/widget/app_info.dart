import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';

import '../../../base/app_fonts.dart';

class AppInfoItem extends StatelessWidget {
  final String icon;
  final String info;
  const AppInfoItem({super.key, required this.icon, required this.info});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.profileColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const Gap(16),
          Text(
            info,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.monserratSemiBold,
              color: AppColors.greenColor,
            ),
          )
        ],
      ),
    );
  }
}
