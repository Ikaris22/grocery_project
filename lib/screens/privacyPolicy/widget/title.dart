import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
class TextTitle extends StatelessWidget{
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: AppFonts.monserratSemiBold,
            decoration: TextDecoration.underline,
            height: 1.7,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}