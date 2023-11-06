import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';

import '../../../base/app_colors.dart';

class SubscriptionItem extends StatefulWidget {
  final String image;
  final String name;
  final String weight;
  final String price;
  final String qty;
  const SubscriptionItem(
      {super.key,
      required this.image,
      required this.name,
      required this.weight,
      required this.price,
      required this.qty});
  @override
  State<StatefulWidget> createState() => _SubscriptionItem();
}

class _SubscriptionItem extends State<SubscriptionItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(widget.image),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: AppFonts.monserratSemiBold,
                    color: AppColors.subscriptionName,
                  ),
                ),
                Text(
                  widget.weight,
                  style: const TextStyle(fontWeight: FontWeight.w200),
                ),
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          fontFamily: AppFonts.helvetica),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16)
              ],
            )
          ],
        ),
        Positioned(
            top: 4,
            right: 8,
            child: Text(
              'Qty: ${widget.qty}',
              style: const TextStyle(
                color: AppColors.subscriptionQty,
                fontFamily: AppFonts.monserratSemiBold,
              ),
            )),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 4,
                  bottom: 2,
                ),
                height: 40,
                width: 152,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: AppColors.greenColor),
                child: SvgPicture.asset(AppLogos.calendarSubscription)))
      ],
    );
  }
}
