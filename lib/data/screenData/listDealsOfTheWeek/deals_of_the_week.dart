class DealsOfTheWeek{
  final String dealImage ;
  final String productName;
  final String saleOff;
  DealsOfTheWeek({required this.dealImage,required this.productName,required this.saleOff});
}
List<DealsOfTheWeek> listdealsOfTheWeek=[
  DealsOfTheWeek(
      dealImage: 'assets/dealsOfTheWeekImages/soft_drink.png',
      productName: 'Soft Drink',
      saleOff: 'Upto 40% off'),
  DealsOfTheWeek(
      dealImage: 'assets/dealsOfTheWeekImages/tea.png',
      productName: 'Tea',
      saleOff: 'Upto 30% off'),
  DealsOfTheWeek(
      dealImage: 'assets/dealsOfTheWeekImages/bath.png',
      productName: 'Bath',
      saleOff: 'Min 20% off')
];