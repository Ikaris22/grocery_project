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
        leading: null,
          appBarChild:  SvgPicture.asset(AppLogos.groceryLogo, height: 52),),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.268,
            margin: const EdgeInsets.only(left: 16, right: 16,top: 12),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(children: [
                  Text('Register', //TODO: dua vao trong file app string
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.w600))
                ]),
                const InputField(
                    textFieldName: RegisterPageString.yourName,
                    textFieldHintText: RegisterPageString.yourNameHint),
                const InputField(
                    textFieldName: RegisterPageString.emailId,
                    textFieldHintText: RegisterPageString.emailIdHint),
                const InputField(
                    textFieldName: RegisterPageString.password,
                    textFieldHintText: RegisterPageString.passwordHint),
                const InputField(
                    textFieldName: RegisterPageString.confirmPassword,
                    textFieldHintText: RegisterPageString.confirmPasswordHint),
                const InputField(
                    textFieldName: RegisterPageString.contactNumber,
                    textFieldHintText: RegisterPageString.contactNumberHint),
                 LogElevatedButton(
                    buttonWidth: double.infinity,
                     buttonName: 'Register', //TODO: dua vao trong file app string
                    onClick: () {}),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const DividerLine(title: 'Or continue with'), //TODO: dua vao trong file app string
                const SizedBox(height: 18),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogButton(logo: AppLogos.googleLogo, logoName: 'Google'),
                    LogButton(logo: AppLogos.fbLogo, logoName: 'Facebook')
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      RegisterPageString.question,
                      style: TextStyle(color: AppColors.miniTextColor),
                    ),
                    TextButtonLogin(
                        textButtonName: 'Login', //TODO: dua vao trong file app string
                        onClick: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>const Login()));
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
