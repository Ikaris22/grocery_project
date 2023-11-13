import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';

class PaymentMethod extends StatelessWidget {
  final String methodName;
  final Widget radio;
  const PaymentMethod({super.key, required this.methodName, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(left: 8),
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.profileColor),
      child: Row(
        children: [
          radio,
          const Gap(8),
          Text(
            methodName,
            style: const TextStyle(
              fontFamily: AppFonts.monserratRegular,
              fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}
