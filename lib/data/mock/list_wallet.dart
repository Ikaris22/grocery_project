class Wallet {
  final String cash;
  final String id;
  final String status;
  final String date;
  Wallet(
      {required this.id,
      required this.cash,
      required this.status,
      required this.date});
}

List<Wallet> listWallet = [
  Wallet(
    id: '111111111111111',
    cash: '\$2',
    status: 'Cashback Received',
    date: '17 Oct,2021',
  ),
  Wallet(
    id: '222222222222222',
    cash: '\$5',
    status: 'Spent On Order',
    date: '12 Oct,2021',
  ),
  Wallet(
    id: '333333333333333',
    cash: '\$3',
    status: 'Cashback Received',
    date: '05 Sep,2021',
  ),
];
