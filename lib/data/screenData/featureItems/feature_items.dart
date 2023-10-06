import 'package:flutter/material.dart';
class FeatureItem{
  final String productImage ;
  final String productName;
  final  String price;
  final String quality;
  final Color color;
  FeatureItem({required this.productName,required this.productImage,
    required this.price,required this.quality,required this.color});
}
List<FeatureItem> listFeatureItem=[
  FeatureItem(
      productName: 'Granola\nPremium Almond',
      productImage: 'assets/featureItemsImage/granola.png',
      price: '\$22.00',
      quality:'1 kg' ,
      color: const Color.fromRGBO(255, 235, 229, 1)),
FeatureItem(
    productName: 'SFT kiwi slice',
    productImage: 'assets/featureItemsImage/kiwi_slice.png',
    price: '\$4.00',
    quality: '3 pcs.',
    color: const Color.fromRGBO(249, 255, 218, 1)),
  FeatureItem(
      productName: 'SFT kiwi slice\n(Dried)',
      productImage: 'assets/featureItemsImage/kiwi_slice_dried.png',
      price: '\$5.00',
      quality: '4pcs.',
      color: const Color.fromRGBO(255, 237, 215, 1))
];