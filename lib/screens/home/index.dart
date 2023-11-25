import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/deals_of_the_week.dart';
import 'package:vippro_project/data/mock/feature_items.dart';
import 'package:vippro_project/data/mock/list_advertisement.dart';
import 'package:vippro_project/data/mock/list_categories.dart';
import 'package:vippro_project/data/mock/list_top_products.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/top_listview_label.dart';

import '../../widgets/small_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changeAdvertisement(value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBars(
          appBarChild: Container(
              padding: const EdgeInsets.only(left: 8),
              height: 48,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 11)
                  ]),
              child: Row(
                children: [
                  SvgPicture.asset(AppLogos.logoSearch),
                  const SizedBox(width: 20),
                  const SizedBox(
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: HomePageStrings.hintSearch,
                          hintStyle: TextStyle(
                              color: AppColors.hintSearchColor, fontSize: 14),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                ],
              ))),
      body: SingleChildScrollView(
          child: Column(
        children: [
          advertisement1(screenHeight),
          indicator(),
          topCategories(screenHeight, screenWidth),
          topProducts(screenHeight, screenWidth),
          advertisement2(screenHeight),
          dealsOfTheWeek(screenHeight, screenWidth),
          featuredItems(screenHeight, screenWidth)
        ],
      )),
    );
  }

  itemDot(int currentIndex, int i) {
    return Container(
      height: 4,
      width: i == currentIndex ? 16 : 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:
              i == currentIndex ? AppColors.greenColor : AppColors.greyColor),
    );
  }

  Widget advertisement1(double screenHeight) {
    return Container(
        height: screenHeight / 5.95,
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
            onPageChanged: (value) => changeAdvertisement(value),
            itemCount: listAd.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listAd[index].adContent,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        listAd[index].adSaleOff,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    listAd[index].adImage,
                    height: 120,
                  )
                ],
              );
            }));
  }

  Widget indicator() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemDot(currentIndex, 0),
          const SizedBox(width: 2),
          itemDot(currentIndex, 1),
          const SizedBox(width: 2),
          itemDot(currentIndex, 2)
        ],
      ),
    );
  }

  Widget topCategories(double screenHeight, double screenWidth) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 8),
          child: TopListviewLabel(
            title: HomePageStrings.topCategories,
            textButtonName: HomePageStrings.exploreAll,
            clickTextButton: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          height: screenHeight / 7,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: screenWidth / 5.1,
                  height: screenHeight / 7,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: (screenHeight / 7) - (screenHeight / 9)),
                        height: screenHeight / 9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.backGroundColor),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: (screenHeight / 7) - (screenHeight / 24)),
                        height: screenHeight / 24,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            color: AppColors.greenColor),
                        child: Center(
                          child: Text(
                            listCategories[index].categoriesName,
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                      Image.asset(
                        listCategories[index].categoriesImage,
                        height: 80,
                        width: 80,
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget topProducts(double screenHeight, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8, bottom: 4),
            child: TopListviewLabel(
              title: HomePageStrings.topProducts,
              textButtonName: HomePageStrings.exploreAll,
              clickTextButton: () {},
            ),
          ),
          SizedBox(
            height: screenHeight / 4.7,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listTopProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backGroundColor),
                      width: screenWidth / 2.8,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12, left: 8),
                            height: screenHeight / 5.6,
                            width: screenWidth / 3.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  listTopProducts[index].productImage,
                                  height: screenHeight / 8,
                                  width: screenWidth / 5.3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(listTopProducts[index].product),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      listTopProducts[index].price,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: screenWidth / 8.3,
                            height: screenHeight / 22,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: AppColors.greenColor),
                            child: Center(
                              child: Text(
                                listTopProducts[index].saleOff,
                                style: const TextStyle(
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          )
                        ],
                      ));
                }),
          ),
        ],
      ),
    );
  }

  Widget advertisement2(double screenHeight) {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
        height: screenHeight / 4.8,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(BannerAdHomePage.adBackground,
                    fit: BoxFit.cover, allowDrawingOutsideViewBox: true)),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(BannerAdHomePage.adImage),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(BannerAdHomePage.getCashback,
                          style: TextStyle(
                              color: AppColors.purpleColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(BannerAdHomePage.adProduct,
                          style: TextStyle(
                              color: AppColors.purpleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight / 8.5, left: 24),
              child: SmallElevatedButton(
                buttonWidth: 128,
                buttonName: HomePageStrings.shopNow,
                onClick: () {},
              ),
            )
          ],
        ));
  }

  Widget dealsOfTheWeek(double screenHeight, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8, bottom: 5),
            child: TopListviewLabel(
              title: HomePageStrings.dealsOfTheWeek,
              textButtonName: HomePageStrings.exploreAll,
              clickTextButton: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    margin: const EdgeInsets.only(right: 16, top: 2),
                    width: screenWidth / 2.8,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.backGroundColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(listdealsOfTheWeek[index].dealImage),
                        Text(listdealsOfTheWeek[index].productName),
                        Text(
                          listdealsOfTheWeek[index].saleOff,
                          style: const TextStyle(color: AppColors.greenColor),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget featuredItems(double screenHeight, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 8,
              bottom: 4,
            ),
            child: TopListviewLabel(
              title: HomePageStrings.featureItems,
              textButtonName: HomePageStrings.exploreAll,
              clickTextButton: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 48),
            height: 188,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 16,
                      bottom: 16,
                    ),
                    margin: const EdgeInsets.only(right: 16, top: 2),
                    width: screenWidth / 2.8,
                    height: 188,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: listFeatureItem[index].color),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(listFeatureItem[index].productImage),
                        Row(
                          children: [
                            Text(
                              listFeatureItem[index].productName,
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listFeatureItem[index].price,
                              style:
                                  const TextStyle(color: AppColors.greenColor),
                            ),
                            Text(listFeatureItem[index].quality)
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
