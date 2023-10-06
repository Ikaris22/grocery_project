import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/screens/fruitsScreen/widgets/container_listview.dart';
import 'package:vippro_project/screens/fruitsScreen/widgets/stack_child.dart';

import '../../data/screenData/listFruits/list_fruits.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FruitsScreen();
}

class _FruitsScreen extends State<FruitsScreen> {
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
        title: const Text('Fruits',
        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23),),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: AppColors.greenColor,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28),
                    topLeft: Radius.circular(28),
                  ),
                  color: Colors.white),
              child: ListView.builder(
                  itemCount: (listFruitsScreen.length / 2).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerListview(
                            stackChild: StackChild(
                              image: listFruitsScreen[index*2].fruitImage,
                              name: listFruitsScreen[index*2].fruitName,
                              weight: listFruitsScreen[index*2].fruitWeight,
                              price: listFruitsScreen[index*2].fruitPrice,
                            )),
                        Visibility(
                          visible: listFruitsScreen.length.isOdd &&
                                  (index * 2 + 1) == listFruitsScreen.length
                              ? false
                              : true,
                          child: ContainerListview(
                            stackChild:  listFruitsScreen.length.isOdd &&
                                (index * 2 + 1) == listFruitsScreen.length
                                ? null
                                : StackChild(
                              image: listFruitsScreen[index*2+1].fruitImage,
                              name: listFruitsScreen[index*2+1].fruitName,
                              weight: listFruitsScreen[index*2+1].fruitWeight,
                              price: listFruitsScreen[index*2+1].fruitPrice,
                                ),
                          )
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
