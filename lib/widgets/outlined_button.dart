import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    super.key,
    required this.logo,
    required this.logoName,
  });

  final String logo;
  final String logoName;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(180, 45),
        side: const BorderSide(
          color: AppColors.greenColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(logo),
          const SizedBox(width: 10),
          Text(
            logoName,
            style: const TextStyle(
              color: AppColors.logoNameColor,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
