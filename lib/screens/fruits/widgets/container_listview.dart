import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';

class ContainerListview extends StatelessWidget {
  final Widget? stackChild;

  const ContainerListview({super.key, required this.stackChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      margin: const EdgeInsets.only(bottom: 16),
      width: 180, //TODO: xem lai cach xu ly view bang GridView thay the cach xu ly hien tai
      height: 228, //TODO: xem lai cach xu ly view bang GridView thay the cach xu ly hien tai
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.backGroundColor,
      ),
      child: stackChild,
    );
  }
}
