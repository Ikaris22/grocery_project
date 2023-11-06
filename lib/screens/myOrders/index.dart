import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_orders.dart';
import 'package:vippro_project/screens/myOrders/widget/decor.dart';
import 'package:vippro_project/screens/myOrders/widget/edit_order.dart';
import 'package:vippro_project/screens/myOrders/widget/get_invoice_button.dart';
import 'package:vippro_project/screens/myOrders/widget/order_item.dart';
import 'package:vippro_project/screens/myOrders/widget/track_order_button.dart';
import 'package:vippro_project/screens/myOrders/widget/view_order_button.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_colors.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<StatefulWidget> createState() => _MyOrders();
}

class _MyOrders extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: MyOrdersStrings.appBarTitle,
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
            padding: const EdgeInsets.only(
              top: 28,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(28),
                topLeft: Radius.circular(28),
              ),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                const Text(
                  MyOrdersStrings.title,
                  style: TextStyle(
                    fontFamily: AppFonts.monserratSemiBold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Decor(height: 208),
                    const Gap(12),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            OrderItem(
                              image: listOrders[0].image,
                              blurImage: listOrders[0].blurImage,
                              deliver: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listOrders[0].deliver,
                                    style: const TextStyle(
                                      fontFamily: AppFonts.monserratSemiBold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    listOrders[0].deliverTime!,
                                    style: const TextStyle(
                                      fontFamily: AppFonts.monserratRegular,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ViewOrderButton(), TrackOrderButton()],
                            ),
                            const Gap(8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EditOrder(),
                                GetInvoice(),
                              ],
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Decor(height: 172),
                    const Gap(12),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            OrderItem(
                              image: listOrders[1].image,
                              blurImage: listOrders[1].blurImage,
                              deliver: Text(
                                listOrders[1].deliver,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.monserratSemiBold,
                                ),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ViewOrderButton(),
                                GetInvoice(),
                              ],
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Decor(height: 164),
                    const Gap(12),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            OrderItem(
                              image: listOrders[2].image,
                              blurImage: listOrders[2].blurImage,
                              deliver: Text(
                                listOrders[2].deliver,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.monserratSemiBold,
                                ),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ViewOrderButton(),
                                GetInvoice(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
