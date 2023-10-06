import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/screens/homeScreen/home_screen.dart';
import 'accountScreen/account_screen.dart';
import 'cartScreen/cart_screen.dart';
import 'exploreScreen/explore_screen.dart';
import 'favouriteScreen/favourite_screen.dart';


class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}
class _MainPage extends State<MainPage>{
  int selectedScreen = 0;
  static const List<Widget> screenOption =[
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
            child: screenOption[selectedScreen],
        ),
      bottomNavigationBar: SizedBox(
        height: 68,
        child: BottomNavigationBar(
          backgroundColor: AppColors.greenColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            navBar(icon: NavBarIcons.icHome, label: 'Home',selectedScreen: selectedScreen,indexItem: 0),
            navBar(icon: NavBarIcons.icExplore, label: 'Explore',selectedScreen: selectedScreen,indexItem: 1),
            navBar(icon: NavBarIcons.icCart, label: 'Cart',selectedScreen: selectedScreen,indexItem: 2),
            navBar(icon: NavBarIcons.icFav, label: 'Favourite',selectedScreen: selectedScreen,indexItem: 3),
            navBar(icon: NavBarIcons.icAccount, label: 'Account',selectedScreen: selectedScreen,indexItem: 4),
          ],
          currentIndex: selectedScreen,
          onTap: (int index){
            setState(() {
              selectedScreen=index;
            });
          },
        ),
      ),
    );
  }
  navBar({required String icon,required String label,required int selectedScreen,required int indexItem}) {
    return BottomNavigationBarItem(
        icon: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: selectedScreen==indexItem?Colors.white:AppColors.greenColor ,
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(icon,colorFilter: ColorFilter.mode(
              selectedScreen==indexItem?AppColors.greenColor:Colors.white,BlendMode.srcIn ),fit: BoxFit.scaleDown,),
        ),
        label: label,
        backgroundColor: AppColors.greenColor);
  }
}

