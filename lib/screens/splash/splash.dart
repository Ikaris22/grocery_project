import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';

import '../login/login.dart';
class Splash extends StatelessWidget{
  const Splash({super.key});


  @override
  Widget build(BuildContext context) {
    startWidget() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
    Future.delayed(const Duration(seconds: 2), () => startWidget());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SvgPicture.asset('assets/images/sg_grocery_logo.svg')
              ]
           ),
        const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[Text('Your needs in just one place',
              style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 24,
                  fontFamily: 'Medium',
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w300
              ),)]
        )
       ],
    );
  }

}