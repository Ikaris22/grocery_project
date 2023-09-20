import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import 'package:vippro_project/widgets/elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset(AppLogos.groceryLogo, height: 53),
        Container(
          height: MediaQuery.of(context).size.height / 1.263,
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                Text('Register',
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.greenColor,
                        fontWeight: FontWeight.bold))
              ]),
              Textfield(
                  textfieldName: 'Your Name',
                  textfieldHintText: 'Enter Your Name'),
              Textfield(
                  textfieldName: 'Email Id',
                  textfieldHintText: 'Enter Your Email Id'),
              Textfield(
                  textfieldName: 'Password',
                  textfieldHintText: 'Enter Your Password'),
              Textfield(
                  textfieldName: 'Confirm Password',
                  textfieldHintText: 'Enter Your Password'),
              Textfield(
                  textfieldName: 'Contact Number',
                  textfieldHintText: 'Enter Your Contact Number'),
               GreenButton(
                  buttonWidth: double.infinity, buttonName: 'Register'),
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
                    'Already Have An Account',
                    style: TextStyle(color: AppColors.miniTextColor),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
