import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/divider_line.dart';

import '../../widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/images/sg_grocery_logo.svg', height: 55),
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
            const Textfield(
                textfieldName: 'Email Id',
                textfieldHintText: 'Enter your Email Id'),
            const Textfield(
                textfieldName: 'Password',
                textfieldHintText: 'Enter Your Password'),
            Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            const DividerLine(title: 'Or continue with'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogButton(
                  logo: 'assets/images/logo_gg.svg',
                  logoName: 'Google',
                ),
                LogButton(
                    logo: 'assets/images/logo_fb.svg', logoName: 'Facebook')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t You Have an Account?',
                  style: TextStyle(color: AppColors.miniTextColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ));
  }
}
