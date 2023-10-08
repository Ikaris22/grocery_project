class DairyProducts {
  final String dairyProductsImage;
  final String dairyProductsName;
  final String dairyProductsWeight;
  final String dairyProductsPrice;
  DairyProducts(
      {required this.dairyProductsImage,
      required this.dairyProductsName,
      required this.dairyProductsWeight,
      required this.dairyProductsPrice});
}
List<DairyProducts> listDairyProducts=[
  DairyProducts(
      dairyProductsImage: 'assets/exploreScreenImg/dairy_1.png',
      dairyProductsName: 'A2MATE milk',
      dairyProductsWeight: '0,5 ltr.',
      dairyProductsPrice: '\$2'),
  DairyProducts(
      dairyProductsImage: 'assets/exploreScreenImg/dairy_2.png',
      dairyProductsName: 'Amul Butter',
      dairyProductsWeight: '0.5 ltr.',
      dairyProductsPrice: '\$2'),
  DairyProducts(
      dairyProductsImage: 'assets/exploreScreenImg/dairy_3.png',
      dairyProductsName: 'Sofit soya milk',
      dairyProductsWeight:'0.5 ltr.' ,
      dairyProductsPrice: '\$2'),
  DairyProducts(
      dairyProductsImage: 'assets/exploreScreenImg/dairy_4.png',
      dairyProductsName: 'Peanut',
      dairyProductsWeight: '0.5 ltr.',
      dairyProductsPrice: '\$2')
];
