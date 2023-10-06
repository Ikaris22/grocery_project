import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/text_font.dart';
import 'package:vippro_project/screens/main_page.dart';
import 'package:vippro_project/screens/splash/splash.dart';

SharedPreferences? prefs;
void main() {
  runApp(const MyApp());
  initSharedPreference();
}
Future<void>initSharedPreference() async {
  prefs = await SharedPreferences.getInstance();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: TextFont.themeTextFont,scaffoldBackgroundColor: AppColors.whiteColor),
      home: const GroceryApp() ,
    );

  }
}
class GroceryApp extends StatefulWidget{
  const GroceryApp({super.key});

  @override
  State<StatefulWidget> createState() => _GroceryApp();
}
class _GroceryApp extends State<GroceryApp>{
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: Center(
          child:Splash()
      ),
    );
  }
}
