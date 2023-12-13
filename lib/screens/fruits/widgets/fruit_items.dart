import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/widgets/count_button.dart';
import '../../../base/app_colors.dart';
import '../../../base/app_images.dart';
import '../../../widgets/subcribe_button.dart';

class ProductItems extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String weight;
  final String isFavIcon;
  final Function() clickDetails;
  final Function() clickFav;

  const ProductItems(
      {super.key,
      required this.price,
      required this.weight,
      required this.name,
      required this.image,
      required this.clickDetails,
      required this.isFavIcon,
      required this.clickFav});

  @override
  State<StatefulWidget> createState() => _FruitItems();
}

class _FruitItems extends State<ProductItems> {
  bool isTextLongEnough(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 17),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);

    return textPainter.width > MediaQuery.of(context).size.width / 4.6;
  }

  Widget buildMarquee(String text) {
    return Marquee(
      text: text,
      style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: AppColors.textGreyColor),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 8,
      startPadding: 0,
      pauseAfterRound: const Duration(seconds: 1),
      accelerationDuration: const Duration(seconds: 2),
    );
  }

  Widget buildNonScrollingText(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.textGreyColor));
  }

  String iconStatus = AppLogos.heartIcon;
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
            margin: const EdgeInsets.only(top: 24, left: 8, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.image,
                  height: 92,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.clickDetails,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3.8,
                          height: 20,
                          child: isTextLongEnough(widget.name)
                              ? buildMarquee(widget.name)
                              : buildNonScrollingText(widget.name)),
                    ),
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
                        buttonColor:
                            subscribeStatus == FruitPageStrings.subscribe
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
                        type: SubButtonType.small,
                      ),
                      SubscribeButton(
                        buttonColor: AppColors.backGroundColor,
                        buttonName: FruitPageStrings.buyOnce,
                        onclick: () {},
                        buttonNameColor: AppColors.greenColor,
                        border: const BorderSide(color: AppColors.greenColor),
                        type: SubButtonType.small,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 12,
              top: 12,
              child: InkWell(
                  onTap: widget.clickFav,
                  child: SvgPicture.asset(widget.isFavIcon))),
        ],
      ),
    );
  }
}
