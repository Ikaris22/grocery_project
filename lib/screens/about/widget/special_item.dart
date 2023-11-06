import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';

class SpecialItem extends StatelessWidget {
  final String icon;
  final String text;
  const SpecialItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const Gap(8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.monserratSemiBold,
          ),
        )
      ],
    );
  }
}
