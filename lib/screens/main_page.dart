import 'package:flutter/material.dart';
import 'package:vippro_project/screens/register/register.dart';
//import 'package:vippro_project/screens/login/login.dart';

//import 'package:vippro_project/screens/splash/splash.dart';
class GroceryApp extends StatefulWidget{
  const GroceryApp({super.key});

  @override
  State<StatefulWidget> createState() => _GroceryApp();
}
class _GroceryApp extends State<GroceryApp>{
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
          body: Center(
                child: Register()
          )
    );
  }

}