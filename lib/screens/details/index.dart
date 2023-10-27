import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';
import 'package:vippro_project/screens/details/widget/related_items.dart';
import 'package:vippro_project/widgets/count_button.dart';
import 'package:vippro_project/widgets/subcribe_button.dart';

import '../../base/app_colors.dart';

class Details extends StatefulWidget {
  final int index;
  const Details({
    super.key,
    required this.index,
  });

  @override
  State<StatefulWidget> createState() => _Details();
}

class _Details extends State<Details> {
  int count = 1;
  int pageIndex = 0;
  changePage(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.6,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 14),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(28),
                          bottomRight: Radius.circular(28))),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(AppLogos.backLogoWhite),
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                      const Text(
                        DetailsPageStrings.details,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: PageView.builder(
                          onPageChanged: (value) => changePage(value),
                          itemCount: 2,
                          itemBuilder: (context, i) {
                            return SizedBox(
                              child: Image.asset(
                                listFruits[widget.index].fruitImage,
                                fit: BoxFit.contain,
                              ),
                            );
                          }),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DotsIndicator(
                          dotsCount: 2,
                          position: pageIndex,
                          decorator: DotsDecorator(
                            size: const Size(8, 8),
                            activeSize: const Size(24, 8),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            colors: [
                              Colors.black12,
                              Colors.black12,
                            ],
                            activeColors: [
                              AppColors.greenColor,
                              AppColors.greenColor,
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: MediaQuery.of(context).size.height / 1.64,
              child: SingleChildScrollView(
                child:
                  Container(
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listFruits[widget.index].fruitName,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 23,
                              type: CountButtonType.medium,
                            )
                          ],
                        ),
                        const Text(
                          DetailsPageStrings.specialPrice,
                          style: TextStyle(
                            fontFamily: 'MonserratRegular',
                            fontSize: 22,
                            color: AppColors.greenColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listFruits[widget.index].fruitPrice,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                            const Text(
                              DetailsPageStrings.saleOff,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'MonserratSemiBold',
                                color: AppColors.greenColor,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          DetailsPageStrings.description,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          DetailsPageStrings.descriptionContent,
                          style: TextStyle(
                            color: AppColors.paymentTextColor,
                            fontSize: 16,
                            fontFamily: 'MonserratRegular',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SubscribeButton(
                              buttonColor: AppColors.greenColor,
                              buttonName: FruitPageStrings.subscribe,
                              onclick: () {
                                setState(() {
                                  print(MediaQuery.of(context).size.height);
                                });
                              },
                              buttonNameColor: AppColors.whiteColor,
                              border: null,
                              type: SubButtonType.medium,
                            ),
                            const SizedBox(width: 24),
                            SubscribeButton(
                              buttonColor: AppColors.whiteColor,
                              buttonName: FruitPageStrings.buyOnce,
                              onclick: () {},
                              buttonNameColor: AppColors.greenColor,
                              border:
                                  const BorderSide(color: AppColors.greenColor),
                              type: SubButtonType.medium,
                            )
                          ],
                        ),
                        const Text(
                          DetailsPageStrings.relatedItems,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RelatedItems(
                              image: AppImages.relatedItems1,
                              name: DetailsPageStrings.pinapple,
                              topBackgroundColor: AppColors.relatedItemsColor1,
                              bottomBackgroundColor: AppColors.relatedItemsColor2,
                            ),
                            RelatedItems(
                              image: AppImages.relatedItems2,
                              name: DetailsPageStrings.strawberry,
                              topBackgroundColor: AppColors.relatedItemsColor1,
                              bottomBackgroundColor: AppColors.relatedItemsColor3,
                            ),
                            RelatedItems(
                              image: AppImages.relatedItems3,
                              name: DetailsPageStrings.grapes,
                              topBackgroundColor: AppColors.relatedItemsColor1,
                              bottomBackgroundColor: AppColors.relatedItemsColor2,
                            ),
                          ],
                        )
                      ],
                    ),
                  )

              ))
        ],
      ),
    );
  }
}
