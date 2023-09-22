import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_string.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/screens/register/register.dart';
import 'package:vippro_project/widgets/elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import 'package:vippro_project/widgets/text_button.dart';

import '../../widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.335,
              margin: const EdgeInsets.only(top:25,left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppLogos.groceryLogo, height: 53),
                  SvgPicture.asset('assets/images/pana.svg'),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Login',
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  const InputField(
                      textfieldName: LoginPageString.emailId,
                      textfieldHintText: LoginPageString.emailIdHint),
                  const InputField(
                      textfieldName: LoginPageString.password,
                      textfieldHintText: LoginPageString.passwordHint),
                   ElevatedButtonWidget(
                      buttonWidth: double.infinity,
                      buttonName: 'Login',
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
                      LogButton(
                        logo: AppLogos.googleLogo,
                        logoName: 'Google',
                      ),
                      LogButton(
                          logo: AppLogos.fbLogo, logoName: 'Facebook')
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        LoginPageString.question,
                        style: TextStyle(color: AppColors.miniTextColor),
                      ),
                      TextButtonWidget(
                          textButtonName: 'Register',
                          onClick: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>const Register()));
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
