import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../base/app_colors.dart';
import '../base/app_fonts.dart';
import '../base/app_images.dart';
import '../base/app_strings.dart';
import '../screens/contactUs/widget/textfield_item.dart';
class ContactTextField extends StatefulWidget{
  const ContactTextField({super.key});

  @override
  State<StatefulWidget> createState() =>_ContactTextField();

}
class _ContactTextField extends State<ContactTextField>{
  String selectedImage = 'image1';

  Map<String, String> imageOptions = {
    'image1': AppImages.flag,
    'image2': AppImages.flag,
    'image3': AppImages.flag,
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldItem(
          height: 60,
          hintText: ContactUsStrings.firstName,
        ),
        const Gap(16),
        const TextFieldItem(
          height: 60,
          hintText: ContactUsStrings.lastName,
        ),
        const Gap(16),
        const TextFieldItem(
          height: 60,
          hintText: ContactUsStrings.email,
        ),
        const Gap(16),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.dividerColor,
          ),
          child: Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedImage,
                  items: imageOptions.keys.map((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Row(
                        children: [
                          Image.asset(
                            imageOptions[key]!,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedImage = newValue!;
                    });
                  },
                ),
              ),
              const Gap(16),
              Container(
                height: 48,
                width: 1,
                color: AppColors.greenColor,
              ),
              const Gap(16),
              const Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ContactUsStrings.phoneNumber,
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.monserratRegular,
                      fontSize: 18,
                      color: AppColors.subscriptionQty,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}