import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_string.dart';
import 'package:vippro_project/base/logo.dart';
import 'package:vippro_project/data/prefs/prefs.dart';
import 'package:vippro_project/screens/main_page.dart';
import 'package:vippro_project/screens/register/register.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';
import 'package:vippro_project/widgets/outlined_button.dart';
import 'package:vippro_project/widgets/divider_line.dart';
import '../../main.dart';
import '../../widgets/textbutton_login.dart';
import '../../widgets/text_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  void setLogin(bool value) {
    prefs?.setBool(PrefKey.isLogin, value);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBars(
        leading: null,
        appBarChild:
        SvgPicture.asset(AppLogos.groceryLogo, height: 52),),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.552,
                margin: const EdgeInsets.only(left: 15, right: 15,top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/appLogo/pana.svg'),
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
                        textFieldName: LoginPageString.emailId,
                        textFieldHintText: LoginPageString.emailIdHint),
                    const InputField(
                        textFieldName: LoginPageString.password,
                        textFieldHintText: LoginPageString.passwordHint),
                     LogElevatedButton(
                        buttonWidth: double.infinity,
                        buttonName: 'Login',
                     onClick: () {
                          setLogin(true);
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context)=>const MainPage()));
                     }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    const DividerLine(title: 'Or continue with'),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          LoginPageString.question,
                          style: TextStyle(color: AppColors.miniTextColor),
                        ),
                        TextButtonLogin(
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
