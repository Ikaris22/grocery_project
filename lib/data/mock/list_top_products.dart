class ListTopProducts {
  final String saleOff;
  final String productImage;
  final String product;
  final String price;
  ListTopProducts({required this.price,required this.product,required this.productImage,required this.saleOff});
}
List<ListTopProducts> listTopProducts=[
ListTopProducts(
    price: '3\$/kg',
    product: 'Fortune Rice',
    productImage: 'assets/topProductsImage/products_top1.png',
    saleOff: '37%\noff'),
  ListTopProducts(
    price: '3\$/kg',
    product: 'Fresh Avocado',
    productImage: 'assets/topProductsImage/products_top2.png',
    saleOff: '37%\noff'),
  ListTopProducts(
    price: '3\$/kg',
    product: 'Orange',
    productImage: 'assets/topProductsImage/products_top3.png',
    saleOff: '37%\noff'),

];