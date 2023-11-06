import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/mock/subscription.dart';
import 'package:vippro_project/screens/subscriptions/widget/item.dart';
import 'package:vippro_project/widgets/ticket.dart';

import '../../base/app_images.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({super.key});

  @override
  State<StatefulWidget> createState() => _MySubscription();
}

class _MySubscription extends State<MySubscription> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height / 6.5,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.greenColor,
          title: SizedBox(
            height: MediaQuery.of(context).size.height / 6.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppLogos.backLogoWhite),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      SubscriptionStrings.appbarTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: SvgPicture.asset(AppLogos.dropdownIcon),
                        elevation: 16,
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: 'MonserratSemiBold',
                            fontSize: 16),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.greenColor,
            ),
            Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
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
                    Row(
                      children: [
                        const Text(
                          SubscriptionStrings.today,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          SubscriptionStrings.date,
                          style: TextStyle(
                            fontFamily: 'MonserratRegular',
                            fontSize: 17,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppLogos.calendarIcon))
                      ],
                    ),
                    SizedBox(
                      height: 380,
                      child: ListView.builder(
                          itemCount: listSubscription.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 116,
                                margin: index == listSubscription.length - 1
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
                                child: SubscriptionItem(
                                  image: listSubscription[index].image,
                                  name: listSubscription[index].name,
                                  weight: listSubscription[index].weight,
                                  price: listSubscription[index].price,
                                  qty: listSubscription[index].qty,
                                ));
                          }),
                    ),
                    const Gap(32),
                    Image.asset(AppImages.bannerSubscription)
                  ],
                ))
          ],
        ));
  }
}

List<String> list = <String>[
  'Subscription - Daily',
  'Subscription - Weekly',
  'Subscription - Monthly',
  'Subscription - Yearly',
];
