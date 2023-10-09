
class Vegetables {
  final String vegetablesImage;
  final String vegetablesName;
  final String vegetablesWeight;
  final String vegetablesPrice;
  Vegetables({required this.vegetablesImage,required this.vegetablesName, required this.vegetablesWeight,required this.vegetablesPrice});
}
List<Vegetables> listVegetables=[
  Vegetables(
      vegetablesImage: 'assets/exploreScreenImg/vegetables_1.png',
      vegetablesName: 'Tomato',
      vegetablesWeight: '1 kg',
      vegetablesPrice: '\$2'),
  Vegetables(
      vegetablesImage: 'assets/exploreScreenImg/vegetables_2.png',
      vegetablesName: 'Potato',
      vegetablesWeight: '1 kg',
      vegetablesPrice: '\$1'),
  Vegetables(
      vegetablesImage: 'assets/exploreScreenImg/vagetables_3.png',
      vegetablesName: 'Potato',
      vegetablesWeight: '1 kg',
      vegetablesPrice: '\$2'),
  Vegetables(
      vegetablesImage: 'assets/exploreScreenImg/vegetables_4.png',
      vegetablesName: 'Orange',
      vegetablesWeight: '1 kg',
      vegetablesPrice: '\$2')
];