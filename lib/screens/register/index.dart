import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  dialogConfirmPass() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Password and ConfirmPassword must match.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  dialogComplete() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Successfully registered account.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<UserCredential?> createAccount({required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            RegisterPageStrings.weakPass,
            style: TextStyle(fontSize: 20),
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            RegisterPageStrings.duplicateEmail,
            style: TextStyle(fontSize: 20),
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

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
                InputField(
                  textFieldName: RegisterPageStrings.yourName,
                  textFieldHintText: RegisterPageStrings.yourNameHint,
                  controller: name,
                ),
                InputField(
                  textFieldName: RegisterPageStrings.emailId,
                  textFieldHintText: RegisterPageStrings.emailIdHint,
                  controller: email,
                ),
                InputField(
                  textFieldName: RegisterPageStrings.password,
                  textFieldHintText: RegisterPageStrings.passwordHint,
                  controller: password,
                ),
                InputField(
                  textFieldName: RegisterPageStrings.confirmPassword,
                  textFieldHintText: RegisterPageStrings.confirmPasswordHint,
                  controller: confirmPassword,
                ),
                InputField(
                  textFieldName: RegisterPageStrings.contactNumber,
                  textFieldHintText: RegisterPageStrings.contactNumberHint,
                  controller: contactNumber,
                ),
                LogElevatedButton(
                  buttonWidth: double.infinity,
                  buttonName: RegisterPageStrings.register,
                  onClick: () async {
                    if (password.text == confirmPassword.text) {
                      final register = await createAccount(
                          email: email.text, password: password.text);
                      if (register != null) {
                        dialogComplete();
                      }
                    } else {
                      dialogConfirmPass();
                    }
                  },
                  radius: 10,
                ),
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
