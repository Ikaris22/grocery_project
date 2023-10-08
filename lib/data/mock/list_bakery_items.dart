class BakeryItems {
  final String bakeryImage;
  final String bakeryName;
  final String bakeryWeight;
  final String bakeryPrice;
  BakeryItems(
      {required this.bakeryImage,
      required this.bakeryName,
      required this.bakeryWeight,
      required this.bakeryPrice});
}
List<BakeryItems> listBakery=[
  BakeryItems(
      bakeryImage: 'assets/exploreScreenImg/bakery_1.png',
      bakeryName: 'Parle Rusk',
      bakeryWeight: '500 g',
      bakeryPrice: '\$3'),
  BakeryItems(
      bakeryImage: 'assets/exploreScreenImg/bakery_2.png',
      bakeryName: 'Choco muffin',
      bakeryWeight: '6 pcs.',
      bakeryPrice: '\$4'),
  BakeryItems(
      bakeryImage: 'assets/exploreScreenImg/bakery_3.png',
      bakeryName: 'Harshey\'s Bar',
      bakeryWeight: '43 g',
      bakeryPrice: '\$2'),
  BakeryItems(
      bakeryImage: 'assets/exploreScreenImg/bakery_4.png',
      bakeryName: 'Bread Crums',
      bakeryWeight: '500 g',
      bakeryPrice: '\$5')
];