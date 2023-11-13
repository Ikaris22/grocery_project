import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/data/mock/list_wallet.dart';
import 'package:vippro_project/screens/myWallet/widget/list_item.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_strings.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: MyWalletStrings.appBarTitle,
        clickBack: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.greenColor,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const Text(
                  MyWalletStrings.myBalance,
                  style: TextStyle(
                    fontFamily: AppFonts.monserratSemiBold,
                    fontSize: 20,
                  ),
                ),
                const Gap(12),
                const Text(
                  MyWalletStrings.percent,
                  style: TextStyle(
                    fontFamily: AppFonts.monserratSemiBold,
                    fontSize: 20,
                    color: AppColors.greenColor,
                  ),
                ),
                const Gap(12),
                const Text(
                  MyWalletStrings.use,
                  style: TextStyle(
                    fontFamily: AppFonts.monserratRegular,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: listWallet.length,
                      itemBuilder: (context, index) {
                        return WalletItem(
                          status: listWallet[index].status,
                          cash: listWallet[index].cash,
                          id: listWallet[index].id,
                          date: listWallet[index].date,
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
