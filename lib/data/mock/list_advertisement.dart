
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
