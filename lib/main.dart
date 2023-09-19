import 'package:flutter/material.dart';
import 'package:vippro_project/base/text_font.dart';
import 'package:vippro_project/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(fontFamily: TextFont.themeTextFont),
      home: const GroceryApp() ,
    );

  }

}