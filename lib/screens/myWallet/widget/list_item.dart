import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/screens/myOrders/widget/decor.dart';

import '../../../base/app_colors.dart';

class WalletItem extends StatelessWidget {
  final String cash;
  final String status;
  final String id;
  final String date;
  const WalletItem({
    super.key,
    required this.status,
    required this.cash,
    required this.id,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Decor(height: 132),
        const Gap(12),
        Expanded(
            child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontFamily: AppFonts.monserratRegular,
                  fontSize: 18,
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                height: 88,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        offset: const Offset(0, 0),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          status,
                          style: const TextStyle(
                            fontFamily: AppFonts.monserratSemiBold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Transaction Id: ${id}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.subscriptionQty,
                          ),
                        )
                      ],
                    ),
                    Text(
                      cash,
                      style: const TextStyle(
                          fontSize: 22,
                          fontFamily: AppFonts.monserratSemiBold,
                          color: AppColors.greenColor),
                    )
                  ],
                ),
              ),
              const Gap(24),
            ],
          ),
        ))
      ],
    );
  }
}
