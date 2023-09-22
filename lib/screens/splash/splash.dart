import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/logo.dart';

import '../login/login.dart';
class Splash extends StatefulWidget{
   const Splash({super.key});
  @override
  State<StatefulWidget> createState() =>_Splash();
}
class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => startWidget());
  }
  startWidget() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
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
            children: [Text('Your needs in just one place',
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
    );
  }
}

