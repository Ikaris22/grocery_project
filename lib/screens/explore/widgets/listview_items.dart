import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';
import '../../../widgets/add_button.dart';

class ListviewItems extends StatelessWidget {
  final String image;
  final String productName;
  final String productWeight;
  final String productPrice;

  const ListviewItems(
      {super.key,
      required this.image,
      required this.productName,
      required this.productWeight,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 4,
      ),
      width: 108,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backGroundColor),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                height: 52,
              ),
              Row(
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(productWeight,
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w300)),
                ],
              ),
              Row(
                children: [
                  Text(
                    productPrice,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
          const AddButton(),
        ],
      ),
    );
  }
}
