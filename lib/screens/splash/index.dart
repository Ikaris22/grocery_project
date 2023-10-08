import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/data/prefs/prefs.dart';
import 'package:vippro_project/screens/main_page.dart';

import '../../main.dart';
import '../login/index.dart';
class Splash extends StatefulWidget {
   const Splash({super.key});
  @override
  State<StatefulWidget> createState() =>_SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => startWidget());
  }


  startWidget() {
    if(checkLogin()){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    }else{
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );}
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppLogos.groceryLogo)
              ]
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Your needs in just one place', //TODO: dua vao trong file app string
                style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 24,
                    fontFamily: 'Medium',
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w300
                ),)
              ]
          )
        ],
      )
    ;
  }
}

