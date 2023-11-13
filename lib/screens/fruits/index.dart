import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';
import 'package:vippro_project/screens/details/index.dart';
import 'package:vippro_project/screens/explore/index.dart';
import 'package:vippro_project/screens/fruits/widgets/fruit_items.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../data/local/db_helper.dart';
import '../../data/model/fruits.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  // List<Fruit> fruit =[];
  // @override
  // void initState() {
  //   loadFruit();
  //   super.initState();
  // }

  // Future<void> loadFruit() async {
  //   final db = await DBHelper.instance.database;
  //   final data =  await db.rawQuery('SELECT * FROM fruitTable');
  //   setState(() {
  //     fruit = List.generate(data.length, (index) {
  //       return Fruit(
  //           id: int.parse(data[index]['id'].toString()),
  //           image: data[index]['image'].toString(),
  //           name:data[index]['name'].toString(),
  //           weight: data[index]['weight'].toString(),
  //           price: data[index]['price'].toString(),
  //           count: int.parse(data[index]['count'].toString()),
  //           isFavourite: int.parse(data[index]['isFavourite'].toString()) == 1,
  //           isSubscribed: int.parse(data[index]['isSubscribed'].toString()) == 1
  //       );
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: FruitPageStrings.appbarTitle,
        clickBack: () {
          Navigator.pop(context);
        },
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 228,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return FruitItems(
                      price: listFruits[index].fruitPrice,
                      weight: listFruits[index].fruitWeight,
                      name: listFruits[index].fruitName,
                      image: listFruits[index].fruitImage,
                      clickDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(index: index),
                          ),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
