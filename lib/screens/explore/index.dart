import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_bakery_items.dart';
import 'package:vippro_project/data/mock/list_dairy_products.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';
import 'package:vippro_project/data/mock/list_groceries.dart';
import 'package:vippro_project/data/mock/list_vegetables.dart';
import 'package:vippro_project/screens/explore/widgets/listview_items.dart';
import 'package:vippro_project/screens/fruits/index.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/top_listview_label.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(
        appBarChild: Text(
          ExplorePageStrings.appbarTitle,
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
            title: ExplorePageStrings.groceries,
            textButtonName: ExplorePageStrings.seeAll,
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
            title: ExplorePageStrings.vegetables,
            textButtonName: ExplorePageStrings.seeAll,
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
            title: ExplorePageStrings.fruits,
            textButtonName: ExplorePageStrings.seeAll,
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
                      image: listFruits[index].fruitImage,
                      productName: listFruits[index].fruitName,
                      productWeight: listFruits[index].fruitWeight,
                      productPrice: listFruits[index].fruitPrice);
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
            title: ExplorePageStrings.dairyProducts,
            textButtonName: ExplorePageStrings.seeAll,
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
            title: ExplorePageStrings.bakeryItems,
            textButtonName: ExplorePageStrings.seeAll,
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
