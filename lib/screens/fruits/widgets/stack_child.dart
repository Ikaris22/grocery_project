import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/widgets/count_button.dart';
import 'package:vippro_project/widgets/subcribe_button.dart';

import '../../../base/app_colors.dart';

class StackChild extends StatefulWidget {
  const StackChild(
      {super.key,
        required this.image,
        required this.name,
        required this.weight,
        required this.price});
  final String image;
  final String name;
  final String weight;
  final String price;

  @override
  State<StatefulWidget> createState() => _StackChild();
}

class _StackChild extends State<StackChild> {
  String subscribeStatus = 'Subscribe';
  String icon = 'assets/listFruitsImage/heart_ic.svg';
  int count = 1;
  Color buttonColor = AppColors.greenColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 28),
            Image.asset(
              widget.image,
              height: 80,
            ),
            Row(
              children: [
                Text(widget.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text('(${widget.weight})')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                      color: AppColors.greenColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
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
                  fontSize: 17,
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
                    buttonColor: buttonColor,
                    buttonName: subscribeStatus,
                    onclick: () {
                      setState(() {
                        buttonColor == AppColors.greenColor
                            ? buttonColor =
                        const Color.fromRGBO(143, 143, 143, 1)
                            : buttonColor = AppColors.greenColor;
                        subscribeStatus == 'Subscribe'
                            ? subscribeStatus = 'Subscribed'
                            : subscribeStatus = 'Subscribe';
                      });
                    },
                    buttonNameColor: AppColors.whiteColor,
                    border: null,
                  ),
                  SubscribeButton(
                    buttonColor: AppColors.backGroundColor,
                    buttonName: 'Buy Once',
                    onclick: () {},
                    buttonNameColor: AppColors.greenColor,
                    border: const BorderSide(
                        color: AppColors.greenColor, width: 1.5),
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 4,
          left: 124,
          child: IconButton(
              onPressed: () {
                setState(() {
                  icon == 'assets/listFruitsImage/heart_ic.svg'
                      ? icon = 'assets/listFruitsImage/red_heart_ic.svg'
                      : icon = 'assets/listFruitsImage/heart_ic.svg';
                });
              },
              icon: SvgPicture.asset(icon)),
        ),
      ],
    );
  }
}
