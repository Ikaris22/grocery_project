import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../base/app_colors.dart';
import 'decor.dart';

class OrderItem extends StatelessWidget {
  final String image;
  final String blurImage;
  final Widget deliver;
  final Widget button;
  final double  lineHeight;
  const OrderItem(
      {super.key,
      required this.image,
      required this.blurImage,
      required this.deliver,
      required this.button,
      required this.lineHeight});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Decor(height: lineHeight),
        const Gap(12),
        Expanded(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
                  margin: const EdgeInsets.only(left: 0,top: 4,bottom: 16),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [deliver],
                      ),
                    ],
                  ),
                ),
                button,
              ],
            ),
          ),
        )
      ],
    );
  }
}
