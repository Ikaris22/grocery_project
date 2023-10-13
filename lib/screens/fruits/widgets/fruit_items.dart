import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/widgets/count_button.dart';
import 'package:vippro_project/widgets/favourite_button.dart';

import '../../../base/app_colors.dart';
import '../../../base/app_images.dart';
import '../../../data/mock/list_fruits.dart';
import '../../../widgets/subcribe_button.dart';

class FruitItems extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String weight;

  const FruitItems(
      {super.key,
      required this.price,
      required this.weight,
      required this.name,
      required this.image});

  @override
  State<StatefulWidget> createState() => _FruitItems();
}

class _FruitItems extends State<FruitItems> {
  String iconStatus = AppLogos.redHeartIcon;
  String subscribeStatus = FruitPageStrings.subscribe;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backGroundColor,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 28,left: 8,bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.image,
                  height: 92,
                ),
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGreyColor),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(${widget.weight})',
                      style: const TextStyle(color: AppColors.textGreyColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenColor,
                      ),
                    ),
                    CountButton(
                      onClickSubtract: () {
                        setState(() {
                          count > 1 ? count-- : count = count;
                        });
                      },
                      onClickAdd: () {
                        setState(() {
                          count++;
                        });
                      },
                      count: count.toString(),
                      fontSize: 14,
                      type: CountButtonType.small,
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubscribeButton(
                        buttonColor: subscribeStatus == FruitPageStrings.subscribe
                            ? AppColors.greenColor
                            : AppColors.darkGreyColor,
                        buttonName: subscribeStatus,
                        onclick: () {
                          setState(() {
                            subscribeStatus == FruitPageStrings.subscribe
                                ? subscribeStatus = FruitPageStrings.subscribed
                                : subscribeStatus = FruitPageStrings.subscribe;
                          });
                        },
                        buttonNameColor: AppColors.whiteColor,
                        border: null,
                      ),
                      SubscribeButton(
                        buttonColor: AppColors.backGroundColor,
                        buttonName: FruitPageStrings.buyOnce,
                        onclick: () {},
                        buttonNameColor: AppColors.greenColor,
                        border: const BorderSide(color: AppColors.greenColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
         Positioned(
           right: 0,
            top: 4,
            child: FavouriteButton(
                onClick: () {
                  setState(() {
                    iconStatus == AppLogos.heartIcon
                        ? iconStatus = AppLogos.redHeartIcon
                        : iconStatus = AppLogos.heartIcon;
                    print(iconStatus);
                  });
                },
                icon: iconStatus),
          ),
        ],
      ),
    );
  }
}
