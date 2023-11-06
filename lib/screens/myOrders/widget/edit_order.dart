import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';

class EditOrder extends StatelessWidget {
  const EditOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Text(
        'Edit Order',
        style: TextStyle(
          color: AppColors.greenColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.greenColor,
        ),
      ),
    );
  }
}
