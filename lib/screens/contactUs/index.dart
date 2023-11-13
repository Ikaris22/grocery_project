import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/contactUs/widget/app_info.dart';
import 'package:vippro_project/screens/contactUs/widget/textfield_item.dart';
import 'package:vippro_project/widgets/contact_textfield.dart';
import 'package:vippro_project/widgets/green_appbar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';

import '../../base/app_colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<StatefulWidget> createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: 'Contact Us',
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
                    height: 140,
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 16,
                      bottom: 20,
                    ),
                    margin: const EdgeInsets.only(bottom: 24,left: 16,right: 16,top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 0),
                            blurRadius: 8,
                            spreadRadius: 4,
                          )
                        ]),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ContactUsStrings.getInTouch,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: AppFonts.monserratSemiBold,
                          ),
                        ),
                        Text(ContactUsStrings.getInTouchDetail,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.monserratRegular,
                              height: 2,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
               Container(
                 margin: const EdgeInsets.symmetric(horizontal: 16),
                 child: Column(
                   children: [
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text(
                           ContactUsStrings.yourDetails,
                           style: TextStyle(
                             fontSize: 22,
                             fontFamily: AppFonts.monserratSemiBold,
                           ),
                         ),
                       ],
                     ),
                     const Gap(12),
                     const ContactTextField(),
                     const Gap(16),
                     const TextFieldItem(
                       height: 160,
                       hintText: ContactUsStrings.addInfo,
                     ),
                     const Gap(24),
                     LogElevatedButton(
                         buttonWidth: 200,
                         buttonName: ContactUsStrings.buttonName,
                         onClick: () {},
                         radius: 4),
                     const AppInfoItem(
                       icon: AppLogos.addressInfo,
                       info: ContactUsStrings.addressInfo,
                     ),
                     const AppInfoItem(
                       icon: AppLogos.phoneInfo,
                       info: ContactUsStrings.phoneInfo,
                     ),
                     const AppInfoItem(
                       icon: AppLogos.emailInfo,
                       info: ContactUsStrings.emailInfo,
                     ),
                     const Gap(40),
                   ],
                 ),
               )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
