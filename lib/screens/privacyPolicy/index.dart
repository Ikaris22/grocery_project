import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/privacyPolicy/widget/detail.dart';
import 'package:vippro_project/screens/privacyPolicy/widget/title.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: PrivacyPolicyStrings.appBarTitle,
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
              bottom: 12,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child:  const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PrivacyPolicyStrings.privacyPolicy,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: AppFonts.monserratSemiBold,
                      decoration: TextDecoration.underline
                    ),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        PrivacyPolicyStrings.lastUpdate,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.monserratRegular,
                          color: AppColors.faqTextfeild,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  TextDetail(text: PrivacyPolicyStrings.privacyPolicyDetail),
                  TextTitle(text: PrivacyPolicyStrings.informationCollected),
                  TextDetail(text: PrivacyPolicyStrings.informationCollectedDetail1),
                  TextDetail(text: PrivacyPolicyStrings.informationCollectedDetail2),
                  TextTitle(text: PrivacyPolicyStrings.useOf),
                  TextDetail(text: PrivacyPolicyStrings.useOfDetail),
                  TextTitle(text: PrivacyPolicyStrings.legal),
                  TextDetail(text: PrivacyPolicyStrings.legalDetail),
                  TextTitle(text: PrivacyPolicyStrings.change),
                  TextDetail(text: PrivacyPolicyStrings.changeDetail),
                  Gap(60)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
