
class ListAd {
  final String adImage ;
  final String adContent;
  final String adSaleOff;
  ListAd({required this.adImage,required this.adContent,required this.adSaleOff});
}
List<ListAd> listAd =[
   ListAd(
adImage: 'assets/adImages/advertisement1.png',
adContent: 'Everyday\nEssentials',
adSaleOff: '10% off'),
  ListAd(
      adImage: 'assets/adImages/advertisement2.png',
      adContent: 'Everyday\nEssentials',
      adSaleOff: '20% off'),
  ListAd(
      adImage:'assets/adImages/advertisement3.jpeg',
      adContent:'Everyday\nEssentials',
      adSaleOff: '15% off')
];
class BannerAd{
  static const String adImage = 'assets/adImages/imageAd.png';
  static const String adBackground ='assets/adImages/backgroundAd.svg';
  static const String getCashback ='Get 25% Cashback';
  static const String adProduct = 'on all baby products';
}