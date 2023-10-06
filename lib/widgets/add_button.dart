import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base/app_colors.dart';
import '../base/logo.dart';
class AddButton extends  StatelessWidget{
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 94, left: 66),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.greenColor),
      child: IconButton(
        icon: SvgPicture.asset(AppLogos.addIconButton),
        onPressed: () {},
      ),
    );
  }

}