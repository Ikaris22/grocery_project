class FruitsScreen {
  final String fruitImage;
  final String fruitName;
  final String fruitWeight;
  final String fruitPrice;
  FruitsScreen(
      {required this.fruitImage,
      required this.fruitName,
      required this.fruitWeight,
      required this.fruitPrice});
}
List<FruitsScreen> listFruitsScreen = [
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_1.png',
      fruitName: 'Strawberry',
      fruitWeight: '1 kg',
      fruitPrice: '\$4'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_2.png',
      fruitName: 'Banana',
      fruitWeight: '1 kg',
      fruitPrice: '\$2'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_3.png',
      fruitName: 'Kiwifruit',
      fruitWeight: '3 units',
      fruitPrice: '\$4'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_4.png',
      fruitName: 'Grapes',
      fruitWeight: '1 kg',
      fruitPrice: '\$4'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_5.png',
      fruitName: 'Watermelon',
      fruitWeight: '1 kg',
      fruitPrice: '\$2'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_6.png',
      fruitName: 'Orange',
      fruitWeight: '1 kg',
      fruitPrice: '\$2'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_7.png',
      fruitName: 'Guava',
      fruitWeight: '1 kg',
      fruitPrice: '\$2'),
  FruitsScreen(
      fruitImage: 'assets/listFruitsImage/list_fruit_8.png',
      fruitName: 'Avocado',
      fruitWeight: '2 pcs.',
      fruitPrice: '\$2')
];
