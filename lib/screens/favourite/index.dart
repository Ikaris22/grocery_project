import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';

import '../../base/app_colors.dart';
import '../../base/app_images.dart';
import '../details/index.dart';
import '../fruits/widgets/fruit_items.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<StatefulWidget> createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        title: const Text(
          FavouritePageStrings.appbarTitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.greenColor,
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 28,
                bottom: 12,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent:228
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return FruitItems(
                      price: listFruits[1].fruitPrice,
                      weight: listFruits[1].fruitWeight,
                      name: listFruits[1].fruitName,
                      image: listFruits[1].fruitImage,
                      clickDetails: (){},
                    );
                  }))
        ],
      ),
    );
  }
}
