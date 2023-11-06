import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../base/app_colors.dart';

class OrderItem extends StatelessWidget {
  final String image;
  final String blurImage;
  final Widget deliver;
  const OrderItem(
      {super.key,
      required this.image,
      required this.blurImage,
      required this.deliver});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
      margin: const EdgeInsets.only(left: 0,top: 0,bottom: 20),
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60,
          ),
          const Gap(12),
          Image.asset(blurImage),
          const Gap(24),
          deliver,
        ],
      ),
    );
  }
}
