import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/base/app_textStyles.dart';
import 'package:vippro_project/data/screenData/cartScreen/listCart.dart';
import 'package:vippro_project/screens/cart/widgets/listviewItems.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';
import '../../base/app_colors.dart';
import '../../base/app_images.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/ticket.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  String dropdownValue = list.first;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(
        appBarChild: Text(
          CartPageStrings.appbarTitle,
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: SvgPicture.asset(AppLogos.dropdownIcon),
                      elevation: 16,
                      style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: 'MonserratSemiBold',
                          fontSize: 20),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 380,
                child: ListView.builder(
                    itemCount: listCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 116,
                          margin: index == listCart.length - 1
                              ? const EdgeInsets.only(bottom: 0)
                              : const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  offset: const Offset(0, 3),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                )
                              ]),
                          child: CartItems(
                            image: listCart[index].cartImage,
                            name: listCart[index].cartName,
                            weight: listCart[index].cartWeight,
                            price: listCart[index].cartPrice,
                            oldPrice: listCart[index].cartOldPrice,
                            clickRemoveItem: () {
                              setState(() {
                                listCart.removeAt(index);
                              });
                            },
                          ));
                    }),
              ),
              const SizedBox(height: 24),
              ticket1(),
              const SizedBox(height: 16),
              ticket2(),
              Container(
                  margin: const EdgeInsets.only(
                      top: 20, left: 40, right: 40, bottom: 20),
                  child: const Center(
                    child: Text(
                      CartPageStrings.promoCode,
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              paymentDetails(),
              LogElevatedButton(
                buttonWidth: 200,
                buttonName: CartPageStrings.checkoutButton,
                onClick: () {},
                radius: 4,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  ticket1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ticket(
            radiusBottomRight: 10,
            radiusTopLeft: 0,
            radiusTopRight: 10,
            radiusBottomLeft: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              width: 268,
              height: 104,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                color: AppColors.ticketGreenColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket1Decor),
                      SvgPicture.asset(AppLogos.ticket1Decor),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CartPageStrings.ticket1TextFirst,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        CartPageStrings.ticket1TextSecond,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        CartPageStrings.ticket1TextThird,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        CartPageStrings.ticket1TextFourth,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket1Decor),
                      SvgPicture.asset(AppLogos.ticket1Decor),
                    ],
                  ),
                ],
              ),
            )),
        Ticket(
            radiusBottomRight: 0,
            radiusTopLeft: 10,
            radiusTopRight: 0,
            radiusBottomLeft: 10,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              width: MediaQuery.of(context).size.width - 268 - 33,
              height: 104,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.ticketGreenColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket1Decor),
                      SvgPicture.asset(AppLogos.ticket1Decor),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        CartPageStrings.ticketCode,
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        CartPageStrings.ticket1Code,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket1Decor),
                      SvgPicture.asset(AppLogos.ticket1Decor),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }

  ticket2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ticket(
            radiusBottomRight: 10,
            radiusTopLeft: 0,
            radiusTopRight: 10,
            radiusBottomLeft: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              width: 268,
              height: 104,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                color: AppColors.ticketYellowColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket2Decor),
                      SvgPicture.asset(AppLogos.ticket2Decor),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            CartPageStrings.ticket2TextFirst,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            CartPageStrings.ticket2TextSecond,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        CartPageStrings.ticket2TextThird,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        CartPageStrings.ticket2TextFourth,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket2Decor),
                      SvgPicture.asset(AppLogos.ticket2Decor),
                    ],
                  ),
                ],
              ),
            )),
        Ticket(
            radiusBottomRight: 0,
            radiusTopLeft: 10,
            radiusTopRight: 0,
            radiusBottomLeft: 10,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              width: MediaQuery.of(context).size.width - 268 - 33,
              height: 104,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.ticketYellowColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket2Decor),
                      SvgPicture.asset(AppLogos.ticket2Decor),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        CartPageStrings.ticketCode,
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      SizedBox(height: 2),
                      Text(
                        CartPageStrings.ticket2Code,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppLogos.ticket2Decor),
                      SvgPicture.asset(AppLogos.ticket2Decor),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }

  paymentDetails() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              CartPageStrings.paymentDetails,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 0),
                blurRadius: 0.2,
                spreadRadius: 1.5,
              )
            ],
          ),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CartPageStrings.totalMRP,
                    style: CartTextStyle.paymentDetails,
                  ),
                  Text(
                    CartPageStrings.totalMRPValue,
                    style: CartTextStyle.paymentDetails,
                  )
                ],
              ),
              Divider(
                color: AppColors.dividerColor,
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CartPageStrings.discount,
                    style: CartTextStyle.paymentDetails,
                  ),
                  Text(
                    CartPageStrings.discountValue,
                    style: CartTextStyle.paymentDetails,
                  )
                ],
              ),
              Divider(
                color: AppColors.dividerColor,
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CartPageStrings.shippingCharges,
                    style: CartTextStyle.paymentDetails,
                  ),
                  Text(
                    CartPageStrings.shippingChargesValue,
                    style: CartTextStyle.paymentDetails,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 28),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
            color: AppColors.lightYellow,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                CartPageStrings.total,
                style: CartTextStyle.total,
              ),
              Text(
                CartPageStrings.totalValue,
                style: CartTextStyle.total,
              )
            ],
          ),
        )
      ],
    );
  }
}

List<String> list = [
  'Tomorrow,7 AM - 9 PM',
  '09/10/2023,7 AM - 9 PM',
  '10/10/2023,7 AM - 9 PM'
];
