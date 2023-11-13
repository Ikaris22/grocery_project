import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
class TextDetail extends StatelessWidget{
  final String text;
  const TextDetail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: AppFonts.monserratRegular,
            height: 2.2,
            letterSpacing: 0.7,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}