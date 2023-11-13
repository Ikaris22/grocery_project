import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/list_orders.dart';
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
  Widget delivered() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ViewOrderButton(),
            TrackOrderButton(),
          ],
        ),
        Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EditOrder(),
            GetInvoice(),
          ],
        ),
      ],
    );
  }

  Widget notDeliverYet() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ViewOrderButton(), GetInvoice()],
    );
  }

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
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      MyOrdersStrings.title,
                      style: TextStyle(
                        fontFamily: AppFonts.monserratSemiBold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Expanded(
                    child: ListView.builder(
                        itemCount: listOrders.length,
                        itemBuilder: (context, index) {
                          return OrderItem(
                            image: listOrders[index].image,
                            blurImage: listOrders[index].blurImage,
                            deliver: listOrders[index].deliver,
                            button: listOrders[index].isDelivered == true
                                ? delivered()
                                : notDeliverYet(),
                            lineHeight: listOrders[index].isDelivered == true
                                ? 200
                                : 172,
                          );
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
