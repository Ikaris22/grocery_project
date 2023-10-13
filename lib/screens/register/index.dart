import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/text_button_login.dart';
import 'package:vippro_project/widgets/text_field.dart';

import '../login/index.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        appBarChild: SvgPicture.asset(AppLogos.groceryLogo, height: 52),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.268,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(children: [
                  Text(RegisterPageStrings.register,
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.w600))
                ]),
                const InputField(
                    textFieldName: RegisterPageStrings.yourName,
                    textFieldHintText: RegisterPageStrings.yourNameHint),
                const InputField(
                    textFieldName: RegisterPageStrings.emailId,
                    textFieldHintText: RegisterPageStrings.emailIdHint),
                const InputField(
                    textFieldName: RegisterPageStrings.password,
                    textFieldHintText: RegisterPageStrings.passwordHint),
                const InputField(
                    textFieldName: RegisterPageStrings.confirmPassword,
                    textFieldHintText: RegisterPageStrings.confirmPasswordHint),
                const InputField(
                    textFieldName: RegisterPageStrings.contactNumber,
                    textFieldHintText: RegisterPageStrings.contactNumberHint),
                LogElevatedButton(
                    buttonWidth: double.infinity,
                    buttonName: RegisterPageStrings.register,
                    onClick: () {}, radius: 10,),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const DividerLine(title: RegisterPageStrings.orContinueWith),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogButton(logo: AppLogos.googleLogo, logoName: 'Google'),
                    LogButton(logo: AppLogos.fbLogo, logoName: 'Facebook')
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      RegisterPageStrings.question,
                      style: TextStyle(color: AppColors.miniTextColor),
                    ),
                    TextButtonLogin(
                        textButtonName: RegisterPageStrings.login,
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        })
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
