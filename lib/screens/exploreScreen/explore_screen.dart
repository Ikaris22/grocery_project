import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/screens/fruitsScreen/fruits_screen.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/screens/exploreScreen/widgets/listview_items.dart';
import 'package:vippro_project/widgets/top_listview_label.dart';
import '../../data/screenData/exploreScreen/list_bakery_items.dart';
import '../../data/screenData/exploreScreen/list_dairy_products.dart';
import '../../data/screenData/exploreScreen/list_fruits.dart';
import '../../data/screenData/exploreScreen/list_groceries.dart';
import '../../data/screenData/exploreScreen/list_vegetables.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppLogos.backLogo,
            )),
        appBarChild: const Text(
          'Explore',
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(left: 16, bottom: 24),
            child: Column(
              children: [
                groceries(),
                vegetables(),
                fruits(),
                dairyProducts(),
                bakeryItems()
              ],
            )),
      ),
    );
  }

  groceries() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: 'Groceries',
            textButtonName: 'See all',
            clickTextButton: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listGroceries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listGroceries[index].groceriesImage,
                      productName: listGroceries[index].groceriesName,
                      productWeight: listGroceries[index].groceriesWeight,
                      productPrice: listGroceries[index].groceriesPrice);
                }))
      ],
    );
  }

  vegetables() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: 'Vegetables',
            textButtonName: 'See all',
            clickTextButton: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listVegetables.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listVegetables[index].vegetablesImage,
                      productName: listVegetables[index].vegetablesName,
                      productWeight: listVegetables[index].vegetablesWeight,
                      productPrice: listVegetables[index].vegetablesPrice);
                }))
      ],
    );
  }

  fruits() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: 'Fruits',
            textButtonName: 'See all',
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FruitsScreen()));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listFruits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listFruits[index].fruitsImage,
                      productName: listFruits[index].fruitsName,
                      productWeight: listFruits[index].fruitsWeight,
                      productPrice: listFruits[index].fruitsPrice);
                }))
      ],
    );
  }

  dairyProducts() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: 'Dairy Products',
            textButtonName: 'See all',
            clickTextButton: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDairyProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listDairyProducts[index].dairyProductsImage,
                      productName: listDairyProducts[index].dairyProductsName,
                      productWeight:
                          listDairyProducts[index].dairyProductsWeight,
                      productPrice:
                          listDairyProducts[index].dairyProductsPrice);
                }))
      ],
    );
  }

  bakeryItems() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: 'Bakery Items',
            textButtonName: 'See all',
            clickTextButton: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listBakery.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listBakery[index].bakeryImage,
                      productName: listBakery[index].bakeryName,
                      productWeight: listBakery[index].bakeryWeight,
                      productPrice: listBakery[index].bakeryPrice);
                }))
      ],
    );
  }
}
