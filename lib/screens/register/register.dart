import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_string.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import 'package:vippro_project/widgets/elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/text_button.dart';
import 'package:vippro_project/widgets/text_field.dart';

import '../login/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(AppLogos.groceryLogo, height: 53),
          Container(
            height: MediaQuery.of(context).size.height / 1.263,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(children: [
                  Text('Register',
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold))
                ]),
                const InputField(
                    textfieldName: RegisterPageString.yourName,
                    textfieldHintText: RegisterPageString.yourNameHint),
                const InputField(
                    textfieldName: RegisterPageString.emailId,
                    textfieldHintText: RegisterPageString.emailIdHint),
                const InputField(
                    textfieldName: RegisterPageString.password,
                    textfieldHintText: RegisterPageString.passwordHint),
                const InputField(
                    textfieldName: RegisterPageString.confirmPassword,
                    textfieldHintText: RegisterPageString.confirmPasswordHint),
                const InputField(
                    textfieldName: RegisterPageString.contactNumber,
                    textfieldHintText: RegisterPageString.contactNumberHint),
                 ElevatedButtonWidget(
                    buttonWidth: double.infinity,
                     buttonName: 'Register',
                    onClick: () {}),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const DividerLine(title: 'Or continue with'),
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
                    TextButtonWidget(
                        textButtonName: 'Login',
                        onClick: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>const Login()));
                        })
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
