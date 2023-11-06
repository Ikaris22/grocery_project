class Orders {
  final String deliver;
  final String? deliverTime;
  final String image;
  final String blurImage;
  bool isCheck;
  Orders(
      {required this.isCheck,
      required this.image,
      required this.deliver,
      required this.blurImage,
      required this.deliverTime});
}

List<Orders> listOrders = [
  Orders(
    isCheck: false,
    image: 'assets/orderImages/order1.png',
    deliver: 'Arrives Tomorrow',
    blurImage: 'assets/orderImages/blur_order.png',
    deliverTime: '7AM -PM',
  ),
  Orders(
    isCheck: false,
    image: 'assets/orderImages/order2.png',
    deliver: 'Delivered on 23 oct',
    blurImage: 'assets/orderImages/blur_order.png',
    deliverTime: '',
  ),
  Orders(
    isCheck: false,
    image: 'assets/orderImages/order3.png',
    deliver: 'Delivered on 15 oct',
    blurImage: 'assets/orderImages/blur_order.png',
    deliverTime: '',
  ),
];
