import 'package:flutter/material.dart';

class Groceries {
  final String groceriesImage;
  final String groceriesName;
  final String groceriesWeight;
  final String groceriesPrice;
  Groceries({
    required this.groceriesImage,
    required this.groceriesName,
    required this.groceriesPrice,
    required this.groceriesWeight,
  });
}

List<Groceries> listGroceries = [
  Groceries(
      groceriesImage: 'assets/exploreScreenImg/gloceries_1.png',
      groceriesName: 'Jaggery Powder',
      groceriesWeight: '500 g',
      groceriesPrice: '\$3'),
  Groceries(
      groceriesImage: 'assets/exploreScreenImg/gloceries_2.png',
      groceriesName: 'TATA Arhar Dal',
      groceriesWeight: '1 kg',
      groceriesPrice: '\$4'),
  Groceries(
      groceriesImage: 'assets/exploreScreenImg/gloceries_3.png',
      groceriesName: 'Saffola gold oil',
      groceriesWeight: '5 Ltr + 1 ltr',
      groceriesPrice: '\$20'),
  Groceries(
      groceriesImage: 'assets/exploreScreenImg/gloceries_4.png',
      groceriesName: 'Abcxyz',
      groceriesWeight: 'Moon',
      groceriesPrice: '\$50'),
];
