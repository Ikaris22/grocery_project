class Subscription {
  final String image;
  final String name;
  final String weight;
  final String price;
  final String qty;
  Subscription(
      {required this.name,
      required this.image,
      required this.weight,
      required this.price,
      required this.qty});
}

List<Subscription> listSubscription = [
  Subscription(
      name: 'Amul Gold Milk',
      image: 'assets/subscriptionImage/subscription1.png',
      weight: '500 ml',
      price: '\$2',
      qty: '1'),
  Subscription(
      name: 'Amul Buttermilk',
      image: 'assets/subscriptionImage/subscription2.png',
      weight: '500 ml',
      price: '\$1',
      qty: '3'),
  Subscription(
      name: 'Banana',
      image: 'assets/subscriptionImage/subscription3.png',
      weight: '1 kg',
      price: '\$2',
      qty: '1'),
];
