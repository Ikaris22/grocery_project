import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/data/prefs/prefs.dart';
import 'package:vippro_project/screens/main_page.dart';
import 'package:vippro_project/screens/register/index.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import '../../main.dart';
import '../../widgets/text_button_login.dart';
import '../../widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        appBarChild: SvgPicture.asset(AppLogos.groceryLogo, height: 52),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.552,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppLogos.logoPana),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        LoginPageStrings.login,
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const InputField(
                    textFieldName: LoginPageStrings.emailId,
                    textFieldHintText: LoginPageStrings.emailIdHint,
                  ),
                  const InputField(
                    textFieldName: LoginPageStrings.password,
                    textFieldHintText: LoginPageStrings.passwordHint,
                  ),
                  LogElevatedButton(
                    buttonWidth: double.infinity,
                    buttonName: LoginPageStrings.login,
                    onClick: () {
                      setLogin(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    radius: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  const DividerLine(title: LoginPageStrings.orContinueWith),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LogButton(
                        logo: AppLogos.googleLogo,
                        logoName: LoginPageStrings.logoGoogle,
                      ),
                      LogButton(
                        logo: AppLogos.fbLogo,
                        logoName: LoginPageStrings.logoFacebook,
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        LoginPageStrings.question,
                        style: TextStyle(color: AppColors.miniTextColor),
                      ),
                      TextButtonLogin(
                          textButtonName: LoginPageStrings.register,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
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
