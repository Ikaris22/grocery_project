import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/account/index.dart';
import 'package:vippro_project/screens/cart/index.dart';
import 'package:vippro_project/screens/explore/index.dart';
import 'package:vippro_project/screens/favourite/index.dart';
import 'package:vippro_project/screens/home/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int selectedScreen = 0;
  static const List<Widget> screenOption = [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            navBar(
              icon: NavBarIcons.icHome,
              label: NavbarStrings.home,
              selectedScreen: selectedScreen,
              indexItem: 0,
            ),
            navBar(
              icon: NavBarIcons.icExplore,
              label: NavbarStrings.explore,
              selectedScreen: selectedScreen,
              indexItem: 1,
            ),
            navBar(
              icon: NavBarIcons.icCart,
              label: NavbarStrings.cart,
              selectedScreen: selectedScreen,
              indexItem: 2,
            ),
            navBar(
              icon: NavBarIcons.icFav,
              label: NavbarStrings.favourite,
              selectedScreen: selectedScreen,
              indexItem: 3,
            ),
            navBar(
              icon: NavBarIcons.icAccount,
              label: NavbarStrings.account,
              selectedScreen: selectedScreen,
              indexItem: 4,
            ),
          ],
          currentIndex: selectedScreen,
          onTap: (int index) {
            setState(() {
              selectedScreen = index;
            });
          },
        ),
      ),
    );
  }

  navBar(
      {required String icon,
      required String label,
      required int selectedScreen,
      required int indexItem,}) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: selectedScreen == indexItem ? Colors.white : AppColors.greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            selectedScreen == indexItem ? AppColors.greenColor : Colors.white,
            BlendMode.srcIn,
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
      label: label,
      backgroundColor: AppColors.greenColor,
    );
  }
}
