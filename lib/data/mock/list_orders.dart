import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';

class Orders {
  final Widget deliver;
  final String image;
  final String blurImage;
  bool isDelivered;
  Orders({
    required this.isDelivered,
    required this.image,
    required this.deliver,
    required this.blurImage,
  });
}

List<Orders> listOrders = [
  Orders(
    isDelivered: true,
    image: 'assets/orderImages/order1.png',
    deliver: const Column(
      children: [
        Text(
          'Arrives Tomorrow',
          style:
              TextStyle(fontSize: 16, fontFamily: AppFonts.monserratSemiBold),
        ),
        Gap(12),
        Text(
          '7AM - PM',
          style: TextStyle(fontSize: 16, fontFamily: AppFonts.monserratRegular),
        ),
      ],
    ),
    blurImage: 'assets/orderImages/blur_order.png',
  ),
  Orders(
    isDelivered: false,
    image: 'assets/orderImages/order2.png',
    deliver: const Text(
      'Delivered on 23 oct',
      style: TextStyle(fontSize: 16, fontFamily: AppFonts.monserratSemiBold),
    ),
    blurImage: 'assets/orderImages/blur_order.png',
  ),
  Orders(
    isDelivered: false,
    image: 'assets/orderImages/order3.png',
    deliver: const Text(
      'Delivered on 15 oct',
      style: TextStyle(fontSize: 16, fontFamily: AppFonts.monserratSemiBold),
    ),
    blurImage: 'assets/orderImages/blur_order.png',
  ),
];
