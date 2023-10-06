class Fruits {
  final String fruitsImage;
  final String fruitsName;
  final String fruitsWeight;
  final String fruitsPrice;
  Fruits({required this.fruitsImage,required this.fruitsName,required this.fruitsWeight,required this.fruitsPrice});
}
List<Fruits> listFruits=[
  Fruits(
      fruitsImage: 'assets/exploreScreenImg/fruits_1.png',
      fruitsName: 'Strawberry',
      fruitsWeight: '1 kg',
      fruitsPrice: '\$4'),
  Fruits(
      fruitsImage: 'assets/exploreScreenImg/fruits_2.png',
      fruitsName: 'Banana',
      fruitsWeight: '1 kg',
      fruitsPrice: '\$2'),
  Fruits(
      fruitsImage: 'assets/exploreScreenImg/fruits_3.png',
      fruitsName: 'Kiwifruit',
      fruitsWeight: '1 kg',
      fruitsPrice: '\$4'),
  Fruits(
      fruitsImage: 'assets/exploreScreenImg/fruits_4.png',
      fruitsName: 'Orange',
      fruitsWeight: '1 kg',
      fruitsPrice: '\$2')
];