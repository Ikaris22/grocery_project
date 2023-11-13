import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/privacyPolicy/widget/detail.dart';
import 'package:vippro_project/screens/privacyPolicy/widget/title.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_fonts.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: TermsOfServicesStrings.appBarTitle,
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
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TermsOfServicesStrings.termsAndConditions,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: AppFonts.monserratSemiBold,
                        decoration: TextDecoration.underline),
                  ),
                  Gap(16),
                  Text(
                    TermsOfServicesStrings.detailBold,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.monserratSemiBold,
                      decoration: TextDecoration.underline,
                      height: 2,
                    ),
                  ),
                  Gap(16),
                  TextDetail(text: TermsOfServicesStrings.detail),
                  TextTitle(text: TermsOfServicesStrings.ourDelivery),
                  TextDetail(text: TermsOfServicesStrings.ourDeliveryDetail),
                  TextTitle(text: TermsOfServicesStrings.price),
                  TextDetail(text: TermsOfServicesStrings.priceDetail),
                  TextTitle(text: TermsOfServicesStrings.payment),
                  TextDetail(text: TermsOfServicesStrings.paymentDetail),
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
