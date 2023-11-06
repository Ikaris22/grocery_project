import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/faq/widget/expansion_question.dart';
import 'package:vippro_project/widgets/green_appbar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';

import '../../base/app_images.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FaqScreen();
}

class _FaqScreen extends State<FaqScreen> {
  String categoryValue = listCategory.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: FaqStrings.appBarTitle,
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
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.dividerColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('abc'),
                          value: categoryValue,
                          icon: SvgPicture.asset(AppLogos.dropdownIcon),
                          elevation: 16,
                          style: const TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: 'MonserratSemiBold',
                              fontSize: 16),
                          onChanged: (String? value) {
                            setState(() {
                              categoryValue = value!;
                            });
                          },
                          items: listCategory
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                  const SizedBox(height: 20),
                  const ExpansionQuestion(
                    title: FaqStrings.question1,
                    content: FaqStrings.content1,
                  ),
                  const ExpansionQuestion(
                    title: FaqStrings.question2,
                    content: FaqStrings.content2,
                  ),
                  const ExpansionQuestion(
                    title: FaqStrings.question3,
                    content: FaqStrings.content3,
                  ),
                  const ExpansionQuestion(
                    title: FaqStrings.question4,
                    content: FaqStrings.content4,
                  ),
                  const ExpansionQuestion(
                    title: FaqStrings.question5,
                    content: FaqStrings.content5,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text(
                        FaqStrings.titleQuestion,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.monserratSemiBold,
                          wordSpacing: 0.5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.dividerColor),
                    child: const TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: AppFonts.monserratRegular,
                          fontSize: 14,
                          color: AppColors.miniTextColor,
                        ),
                        hintText: FaqStrings.hintText,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    child: LogElevatedButton(
                        buttonWidth: 100,
                        buttonName: FaqStrings.buttonName,
                        onClick: (){},
                        radius: 4),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

List<String> listCategory = ['Select Category', 'QEQEREF'];
