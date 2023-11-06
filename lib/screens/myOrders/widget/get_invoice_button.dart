import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';

class GetInvoice extends StatelessWidget {
  const GetInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Text(
        'Get Invoice',
        style: TextStyle(
          color: AppColors.greenColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.greenColor,
        ),
      ),
    );
  }
}
