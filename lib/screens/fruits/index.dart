import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/data/mock/list_fruits.dart';
import 'package:vippro_project/screens/fruits/widgets/container_listview.dart';
import 'package:vippro_project/screens/fruits/widgets/stack_child.dart';

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
          'Fruits', //TODO: dua cai nay vao file app_images.dart
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
              top: 24,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(28),
                topLeft: Radius.circular(28),
              ),
              color: Colors.white,
            ),
            child: ListView.builder(
                itemCount: (listFruits.length / 2).ceil(),
                itemBuilder: (BuildContext context, int index) {
                  //TODO: tach functions o line 58 thanh 1 variable @isVisible roi check
                  final isVisible = listFruits.length.isOdd && (index * 2 + 1) == listFruits.length;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: xem lai cach tinh nay nhe, phai dung GridView nhe
                      ContainerListview(
                        stackChild: StackChild(
                          //TODO: xem lai cach tinh nay nhe, phai dung GridView nhe
                          image: listFruits[index * 2].fruitImage,
                          name: listFruits[index * 2].fruitName,
                          weight: listFruits[index * 2].fruitWeight,
                          price: listFruits[index * 2].fruitPrice,
                        ),
                      ),
                      Visibility(
                        //TODO: xem lai cach tinh nay nhe, phai dung GridView nhe
                        //TODO: tach functions o line 58 thanh 1 variable @isVisible roi check
                        visible: isVisible ? false : true,
                        child: ContainerListview(
                          stackChild: isVisible
                              ? null
                              : StackChild(
                                  image: listFruits[index * 2 + 1].fruitImage,
                                  name: listFruits[index * 2 + 1].fruitName,
                                  weight: listFruits[index * 2 + 1].fruitWeight,
                                  price: listFruits[index * 2 + 1].fruitPrice,
                                ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
