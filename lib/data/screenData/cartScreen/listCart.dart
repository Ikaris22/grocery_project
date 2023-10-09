class ListCart {
  final String cartImage;
  final String cartName;
  final String cartPrice;
  final String cartWeight;
  final String cartOldPrice;
  ListCart(
      {required this.cartImage,
      required this.cartName,
      required this.cartPrice,
      required this.cartWeight,
      required this.cartOldPrice});
}

List<ListCart> listCart = [
  ListCart(
      cartImage: 'assets/cartScreenImg/listCart_1.png',
      cartName: 'Shimla Apple',
      cartPrice: '\$2',
      cartWeight: '1 kg',
      cartOldPrice: '\$3.25'),
  ListCart(
      cartImage: 'assets/cartScreenImg/listCart_2.png',
      cartName: 'Basmati Rice',
      cartPrice: '\$4',
      cartWeight: '1 kg',
      cartOldPrice: '\$8'),
  ListCart(
      cartImage: 'assets/cartScreenImg/listCart_3.png',
      cartName: 'Organic Tomatoes',
      cartPrice: '\$1',
      cartWeight: '1 kg',
      cartOldPrice: '\$2')
];
