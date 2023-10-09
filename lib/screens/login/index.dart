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
        leading: null,
        appBarChild: SvgPicture.asset(AppLogos.groceryLogo,
            height: 52), //TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.552, //TODO: khong set view cung cho man hinh, se anh huong toi cac man hinh khac
              margin: const EdgeInsets.only(left: 15, right: 15, top: 16), //TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/appLogo/pana.svg'), //TODO: dua cai nay vao file app_images.dart
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login', //TODO: dua vao trong file app string
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const InputField(
                    textFieldName: LoginPageString.emailId,
                    textFieldHintText: LoginPageString.emailIdHint,
                  ),
                  const InputField(
                    textFieldName: LoginPageString.password,
                    textFieldHintText: LoginPageString.passwordHint,
                  ),
                  LogElevatedButton(
                      buttonWidth: double.infinity,
                      buttonName: 'Login', //TODO: dua vao trong file app string
                      onClick: () {
                        setLogin(true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 15, //TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
                right: 15,//TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
              ),
              child: Column(
                children: [
                  const DividerLine(title: 'Or continue with'),//TODO: dua vao trong file app string
                  const SizedBox(height: 20),//TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LogButton(
                        logo: AppLogos.googleLogo,
                        logoName: 'Google',  //TODO: dua vao trong file app string
                      ),
                      LogButton(
                        logo: AppLogos.fbLogo,
                        logoName: 'Facebook', //TODO: dua vao trong file app string
                      )
                    ],
                  ),
                  const SizedBox(height: 13), //TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
                  //TODO: can lay dung chuan material 4,8,12,16... phai chia het cho 4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        LoginPageString.question,
                        style: TextStyle(color: AppColors.miniTextColor),
                      ),
                      TextButtonLogin(
                          textButtonName: 'Register', //TODO: dua vao trong file app string
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
