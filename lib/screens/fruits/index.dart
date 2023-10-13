import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';
import 'package:vippro_project/screens/fruits/widgets/fruit_items.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppLogos.backLogoWhite),
        ),
        leadingWidth: 36,
        backgroundColor: AppColors.greenColor,
        title: const Text(
          FruitPageStrings.appbarTitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
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
                  itemCount: listFruits.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: MediaQuery.of(context).size.height / 3.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return FruitItems(
                      price: listFruits[index].fruitPrice,
                      weight: listFruits[index].fruitWeight,
                      name: listFruits[index].fruitName,
                      image: listFruits[index].fruitImage,
                    );
                  }))
        ],
      ),
    );
  }
}
