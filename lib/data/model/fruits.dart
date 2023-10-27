import 'package:sqflite/sqflite.dart';

class Fruit {
  final int? id;
  final String image;
  final String name;
  final String weight;
  final String price;
  final int count;
  final bool isFavourite;
  final bool isSubscribed;
  Fruit({this.id,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    this.count = 1,
    this.isFavourite = false,
    this.isSubscribed = false});
  Map<String, dynamic> toMapConvert() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'weight': weight,
      'price': price,
      'count': count,
      'isFavourite': isFavourite ? 1 : 0,
      'isSubscribe': isSubscribed ? 1 : 0,
    };
  }
}
