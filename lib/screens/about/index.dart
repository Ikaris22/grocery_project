import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/about/widget/policy_item.dart';
import 'package:vippro_project/screens/about/widget/special_item.dart';
import 'package:vippro_project/screens/about/widget/text_item.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_colors.dart';
import '../../base/app_images.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GreenAppbar(
        title: AboutStrings.appBarTitle,
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
              top: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppImages.deliverImage),
                        const Gap(12),
                        const TextItem(text: AboutStrings.content1),
                        const Gap(24),
                        const TextItem(text: AboutStrings.content2),
                        const Gap(24),
                        const TextItem(text: AboutStrings.content3),
                        const Gap(24),
                      ],
                    ),
                  ),
                  banner(widthSize),
                  const PolicyItem(text: AboutStrings.privacyPolicy),
                  const PolicyItem(text: AboutStrings.termsAndServices),
                  const Gap(40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  banner(widthSize) {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Container(
              padding: const EdgeInsets.only(
                top: 120,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              width: widthSize,
              height: 440,
              color: AppColors.profileColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AboutStrings.whyChooseUs,
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: 22,
                      fontFamily: AppFonts.monserratSemiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: const Text(
                      AboutStrings.weDoNot,
                      style: TextStyle(
                        fontFamily: AppFonts.monserratSemiBold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    AboutStrings.detail,
                    style: TextStyle(
                        fontFamily: AppFonts.monserratRegular,
                        fontSize: 14,
                        height: 1.9,
                        letterSpacing: 0.8),
                  ),
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpecialItem(
                            text: AboutStrings.organic,
                            icon: AppLogos.organic,
                          ),
                          Gap(12),
                          SpecialItem(
                            text: AboutStrings.service,
                            icon: AppLogos.service,
                          ),
                        ],
                      ),
                      MaxGap(44),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpecialItem(
                            text: AboutStrings.fastDelivery,
                            icon: AppLogos.fastDelivery,
                          ),
                          Gap(12),
                          SpecialItem(
                            text: AboutStrings.secure,
                            icon: AppLogos.secure,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.fruitImage),
              ],
            ))
      ],
    );
  }
}
